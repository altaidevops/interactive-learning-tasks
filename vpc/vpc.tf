resource "aws_vpc" "EU_VPC" {
  cidr_block = "10.0.1.0/16"
  instance_tenancy = "default"
  description = "Private VPC"
  tags = local.commo
}