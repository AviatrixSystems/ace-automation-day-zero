data "aws_instance" "controller" {
  filter {
    name   = "tag:Name"
    values = ["AviatrixController"]
  }
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

data "aws_instance" "copilot" {
  filter {
    name   = "tag:Name"
    values = ["AviatrixCopilot"]
  }
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}
