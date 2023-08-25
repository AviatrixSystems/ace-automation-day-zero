# ACE-IAC Core Aviatrix Infrastructure
# https://registry.terraform.io/modules/terraform-aviatrix-modules/mc-transit/aviatrix/latest
module "aws_transit" {
  source              = "terraform-aviatrix-modules/mc-transit/aviatrix"
  version             = "2.5.0"
  cloud               = "AWS"
  account             = var.aws_account_name
  region              = var.aws_region
  name                = var.aws_transit_name
  gw_name             = var.aws_transit_name
  cidr                = var.aws_transit_cidr
  instance_size       = var.aws_transit_instance_size
  enable_segmentation = true
  ha_gw               = false
}

# https://registry.terraform.io/modules/terraform-aviatrix-modules/mc-spoke/aviatrix/latest
module "aws_spoke_bastion" {
  source         = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version        = "1.6.3"
  cloud          = "AWS"
  account        = var.aws_account_name
  region         = var.aws_region
  name           = var.aws_spoke_bastion_name
  gw_name        = var.aws_spoke_bastion_name
  cidr           = var.aws_spoke_bastion_cidr
  instance_size  = var.aws_spoke_instance_size
  network_domain = aviatrix_segmentation_network_domain.bu1.domain_name
  transit_gw     = module.aws_transit.transit_gateway.gw_name
  ha_gw          = false
}

# https://registry.terraform.io/modules/terraform-aviatrix-modules/mc-spoke/aviatrix/latest
module "aws_spoke_egress" {
  source         = "terraform-aviatrix-modules/mc-spoke/aviatrix"
  version        = "1.6.3"
  cloud          = "AWS"
  account        = var.aws_account_name
  region         = var.aws_region
  name           = var.aws_spoke_egress_name
  gw_name        = var.aws_spoke_egress_name
  cidr           = var.aws_spoke_egress_cidr
  instance_size  = var.aws_spoke_instance_size
  network_domain = aviatrix_segmentation_network_domain.bu2.domain_name
  transit_gw     = module.aws_transit.transit_gateway.gw_name
  ha_gw          = false
  single_ip_snat = true
}

# Network Segmentation
resource "aviatrix_segmentation_network_domain" "bu1" {
  domain_name = "bu1"
}
resource "aviatrix_segmentation_network_domain" "bu2" {
  domain_name = "bu2"
}

# Data source to get AMI details
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

module "security_group_bastion" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.1.0"
  name                = "ace-automation-bastion-sg"
  description         = "Security group for example usage with EC2 instances"
  vpc_id              = module.aws_spoke_bastion.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

module "security_group_egress" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.1.0"
  name                = "ace-automation-app-sg"
  description         = "Security group for example usage with EC2 instances"
  vpc_id              = module.aws_spoke_egress.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp", "all-icmp"]
  egress_rules        = ["all-all"]
}

module "aws_bastion_ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.3.1"
  instance_type               = var.aws_test_instance_size
  name                        = "${var.aws_spoke_bastion_name}-instance"
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = module.aws_spoke_bastion.vpc.public_subnets[0].subnet_id
  vpc_security_group_ids      = [module.security_group_bastion.security_group_id]
  associate_public_ip_address = true
  user_data = templatefile("${path.module}/user_data.tpl",
    {
      password = var.password
      bu       = "bu1"
      instance = "bastion"
  })
}

module "aws_egress_ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.3.1"
  instance_type               = var.aws_test_instance_size
  name                        = "${var.aws_spoke_egress_name}-app"
  ami                         = data.aws_ami.ubuntu.id
  subnet_id                   = module.aws_spoke_egress.vpc.private_subnets[0].subnet_id
  vpc_security_group_ids      = [module.security_group_egress.security_group_id]
  associate_public_ip_address = false
  user_data = templatefile("${path.module}/user_data.tpl",
    {
      password = var.password
      bu       = "bu2"
      instance = "app"
  })
}
