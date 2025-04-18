resource "aws_key_pair" "key" {
  key_name   = var.ssh_key_name
  public_key = var.ssh_key_path
}
resource "aws_instance" "main" {
  ami             = data.aws_ami.this.id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.key.key_name
  security_groups = [aws_security_group.main.name]
  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public.ip"
  }
}
resource "aws_security_group" "main" {
  vpc_id = data.aws_vpc.main.id
  name   = var.sg_name
}
resource "aws_security_group_rule" "main1" {
  for_each          = var.allowed_ports
  type              = each.value.direction
  from_port         = each.value.f_port
  to_port           = each.value.t_port
  protocol          = each.value.protocol
  cidr_blocks       = [each.value.cidr]
  security_group_id = aws_security_group.main.id
}


