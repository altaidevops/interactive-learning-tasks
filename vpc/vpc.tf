resource "aws_vpc" "main {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  description = "Main VPC"
  tags = local.common_tags
}

resource "aws_subnet" "private1" {
  cidr_block = "10.0.1.0/16"
  vpc_id = aws_vpc.main.id
}

resource "aws_subnet" "private2" {
  cidr_block = "10.0.2.0/16"
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc" "private3" {
  cidr_block = "10.0.3.0/16"
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc" "public1" {
  cidr_block = "10.0.10.0/16"
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc" "public2" {
  cidr_block = "10.0.20.0/16"
  vpc_id = aws_vpc.main.id
}

resource "aws_vpc" "public3" {
  cidr_block = "10.0.30.0/16"
  vpc_id = aws_vpc.main.id
}

