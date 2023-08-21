#Frontend Security Group
resource "aws_security_group" "frontend" {
  name   = "${var.project}-frontend"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_ssh.id]
  }
  tags = {
    Name = "${var.project}-frontend"
  }
}

#db Security Group
resource "aws_security_group" "db" {
  name   = "${var.project}-db"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.frontend.id]
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.allow_ssh.id]
  }
  tags = {
    Name = "${var.project}-db"
  }
}

#Allow ssh
resource "aws_security_group" "allow_ssh" {
  name   = "${var.project}-allow_ssh"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_allowed_cidr
  }
  tags = {
    Name = "${var.project}-allow_ssh"
  }
}

resource "aws_security_group" "go_outside" {
  name   = "${var.project}-go_outside"
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = flatten([cidrsubnet(var.vpc_cidr, var.subnet_cidr_bits, 0), cidrsubnet(var.vpc_cidr, var.subnet_cidr_bits, 1), cidrsubnet(var.vpc_cidr, var.subnet_cidr_bits, 2)])
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-go_outside"
  }
}
