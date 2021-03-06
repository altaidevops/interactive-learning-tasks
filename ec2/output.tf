
output "AZ" {
  value = aws_instance.web.availability_zone
}

output "ID" {
  value = aws_instance.web.id
}

output "PIP" {
  value = aws_instance.web.public_ip
}

output "aws_instance_region" {
  value = "us-east-1"
}