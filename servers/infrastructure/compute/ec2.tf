resource "aws_instance" "frontend_node" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = var.key_name
  subnet_id                   = var.nodes_subnet
  availability_zone           = var.availability_zone
  vpc_security_group_ids      = [var.frontend_security_group, var.go_outside_security_group, var.ssh_security_group]
  associate_public_ip_address = "true"

  tags = {
    Name = "${var.project}-frontendNode"
  }
}

resource "aws_instance" "db_node" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_type
  key_name                    = var.key_name
  subnet_id                   = var.nodes_subnet
  availability_zone           = var.availability_zone
  vpc_security_group_ids      = [var.db_security_group, var.go_outside_security_group, var.ssh_security_group]
  associate_public_ip_address = "true"

  tags = {
    Name = "${var.project}-dbNode"
  }
}
