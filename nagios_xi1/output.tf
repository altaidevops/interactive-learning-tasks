

# Shows AMI ID
output "CentOS_ID" {
  value = data.aws_ami.centos.id
}
output "Host_Address" {
  value = aws_instance.nagios.public_ip
}

output "AZ" {
  value = data.aws_availability_zones.all.id
}
