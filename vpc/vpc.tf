# module "vpc" {
#   source = "./modules/vpc"

#   environment               = var.environment
#   vpc_cidr_block            = var.vpc_cidr_block
#   availability_zones        = [ var.az1, var.az2, var.az3 ]
#   public_subnet_cidr_blocks = [ var.public_cidr1, var.public_cidr2, var.public_cidr3 ]
#   private_subnet_cidr_blocks = [ var.private_cidr1, var.private_cidr2, var.private_cidr3 ]
# }

# output "vpc_id" {
#   value = module.vpc.id
# }

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  tags       = var.tags
}