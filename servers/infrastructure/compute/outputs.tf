output "db_node_private_ip" {
  value = aws_instance.db_node.private_ip
}

output "frontend_node_public_ip" {
  value = aws_instance.frontend_node.public_ip
}

output "db_node_public_ip" {
  value = aws_instance.db_node.public_ip
}
