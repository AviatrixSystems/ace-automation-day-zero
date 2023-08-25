variable "password" {
  description = "The Aviatrix controller/copilot and test instance login user password"
}

variable "controller_ip" {
  description = "The Aviatrix controller eip"
}

variable "aws_region" {
  description = "The aws region used for all resources"
  default     = "us-west-2"
}
