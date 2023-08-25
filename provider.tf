provider "aviatrix" {
  controller_ip = var.controller_ip
  username      = "admin"
  password      = var.password
}

provider "aws" {
  region = var.aws_region
  # remove before push
  profile = "build-hub"
}
