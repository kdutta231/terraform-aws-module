data "aws_ami" "this" {
  most_recent = true
  owners      = var.ami_owner
  filter {
    name   = "name"
    values = var.ami_filter
  }
}

data "aws_vpc" "main" {
  default = true
}
