variable "password" {
  description = "The Aviatrix controller/copilot and test instance login user password"
}

variable "aws_account_name" {
  description = "The Aviatrix access account name for the registered aws account"
}

variable "aws_transit_instance_size" {
  description = "The aws transit ec2 instance size"
}

variable "aws_spoke_instance_size" {
  description = "The aws spoke ec2 instance size"
  default     = "t3.medium"
}

variable "aws_test_instance_size" {
  description = "The aws test ec2 instance size"
  default     = "t3.nano"
}

variable "aws_transit_name" {
  description = "The aws transit name"
  default     = "ace-automation-transit"
}

variable "aws_spoke_bastion_name" {
  description = "The aws bastion spoke name"
  default     = "ace-automation-spoke-bastion"
}

variable "aws_spoke_egress_name" {
  description = "The aws egress spoke name"
  default     = "ace-automation-spoke-egress"
}

variable "aws_transit_cidr" {
  description = "The aws transit vpc cidr"
  default     = "10.1.200.0/23"
}

variable "aws_spoke_bastion_cidr" {
  description = "The aws bastion spoke vpc cidr"
  default     = "10.1.211.0/24"
}

variable "aws_spoke_egress_cidr" {
  description = "The aws egress spoke vpc cidr"
  default     = "10.1.212.0/24"
}

variable "aws_region" {
  description = "The aws region used for all resources"
}
