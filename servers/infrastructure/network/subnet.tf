resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_cidr_bits, 1)
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.project}-PublicSubnet"
  }
  map_public_ip_on_launch = true
}
