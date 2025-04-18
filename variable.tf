variable "ami_owner" {
  default = ["099720109477"]
}
variable "ami_filter" {
  default = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
}
variable "allowed_ports" {
  default = {
    ssh = {
      direction = "ingress"
      f_port    = 22
      t_port    = 22
      protocol  = "tcp"
      cidr      = "54.193.78.148/32"
    },
    http = {
      direction = "ingress"
      f_port    = 80
      t_port    = 80
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    },
    https = {
      direction = "ingress"
      f_port    = 443
      t_port    = 443
      protocol  = "tcp"
      cidr      = "0.0.0.0/0"
    },
    all = {
      direction = "egress"
      f_port    = 0
      t_port    = 65535
      protocol  = "-1"
      cidr      = "0.0.0.0/0"
    }
  }
}
variable "sg_name" {
  default = "mysg"
}
variable "ssh_key_name" {
  default = "mykey" 
}
variable "ssh_key_path" {
  default = file("./aws.pub")
}
variable "instance_type" {
  default = "t2.micro"
}
