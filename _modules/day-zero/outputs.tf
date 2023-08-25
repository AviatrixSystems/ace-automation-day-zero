output "bu1_bastion_public_ip" {
  value = module.aws_bastion_ec2.public_ip
}

output "bu1_bastion_private_ip" {
  value = module.aws_bastion_ec2.private_ip
}

output "bu2_app_private_ip" {
  value = module.aws_egress_ec2.private_ip
}

output "bu1_network_domain_name" {
  value = aviatrix_segmentation_network_domain.bu1.domain_name
}

output "bu2_network_domain_name" {
  value = aviatrix_segmentation_network_domain.bu2.domain_name
}

output "controller_ip" {
  value = data.aws_instance.controller.public_ip
}

output "copilot_ip" {
  value = data.aws_instance.copilot.public_ip
}
