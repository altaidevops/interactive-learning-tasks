output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets" {
  value = var.private_subnet1
}

output "public_subnets" {
  value = var.public_subnet1
}

output "security_group_id" {
  value = aws_security_group.mysql.id
}

