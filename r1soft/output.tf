

# Shows AMI ID
output "CENTOS_ID" {
  value = data.aws_ami.centos.id
}
output "Host_Address" {
  value = aws_instance.r1soft.public_ip
}

output "AZ" {
  value = data.aws_availability_zones.all.names
}
