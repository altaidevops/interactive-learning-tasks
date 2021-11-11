variable "region" {
  type        = string
  description = "Please provide a region for instances"
  default     = "us-east-1"
}
variable "key_name" {
  type        = string
  description = "Please provide a key pair name for instances"
  default     = "bastion-host-key"
}
variable "aws_security_group" {
  type        = string
  description = "Please provide a sec group name for instances"
  default     = "web_traffic"
}
variable "instance_type" {
  type        = string
  description = "Please provide an instance type"
  default     = "t2.micro"
}

variable "ingressrules" {
  type    = list(number)
  default = [80, 443, 22]
}

variable "tags" {
  description = "Tags to be used"
  type        = map(any)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Nagios_Server"
  }
}