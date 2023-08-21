# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name" = "${var.project}-InternetGateWay"
  }

  depends_on = [aws_vpc.this]
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project}-RouteTable"
  }
}

resource "aws_route_table_association" "internet_access" {
  subnet_id      = aws_subnet.this.id
  route_table_id = aws_route_table.main.id
}
