variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "region" {
  default = "eu-west-1"
}
variable "private_cidr_block1" {
  default = "10.0.1.0/24"
}
variable "private_cidr_block2" {
  default = "10.0.2.0/24"
}
variable "private_cidr_block3" {
  default = "10.0.3.0/24"
}
variable "public_cidr_block1" {
  default = "10.0.101.0/24"
}
variable "public_cidr_block2" {
  default = "10.0.102.0/24"
}
variable "public_cidr_block3" {
  default = "10.0.103.0/24"
}

variable "tags" {
  # type = map(string)
   description = "Tags to be used"
  type        = map(any)
  default = {
    Terraform   = "true"
    Environment = "dev"}
}
