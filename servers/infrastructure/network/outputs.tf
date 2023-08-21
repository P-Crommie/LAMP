output "nodes_subnet" {
  value = aws_subnet.this.id
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "ssh_security_group" {
  value = aws_security_group.allow_ssh.id
}

output "frontend_security_group" {
  value = aws_security_group.frontend.id
}

output "db_security_group" {
  value = aws_security_group.db.id
}

output "go_outside_security_group" {
  value = aws_security_group.go_outside.id
}
