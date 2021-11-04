resource "aws_instance" "web" {
    ami = "ami-0447addf6c74624eb"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    user_data = file("userdata.sh")
    tags = local.common_tags
}