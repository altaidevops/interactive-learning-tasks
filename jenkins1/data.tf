data "aws_ami" "centos" {
  most_recent = true
  owners      = ["679593333241"] # CentOS Owner
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM *"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# This pulls AWS A-Z information
data "aws_availability_zones" "all" {}