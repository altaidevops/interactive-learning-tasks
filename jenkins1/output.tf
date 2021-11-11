

# Shows AMI ID
output "CentOS_ID" {
  value = data.aws_ami.centos.id
}
output "Host_Address" {
  value = aws_instance.jenkins.public_ip
}

output "AZ" {
  value = data.aws_availability_zones.all.id
}

output "Jenkins_URL" {
  value = aws_route53_record.jenkins.name
}

output "Jenkins_User" {
  value = "admin"
}

output "Jenkins_Passwd" {
  value = "redhat"
}