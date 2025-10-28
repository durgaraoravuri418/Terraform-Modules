module "aws_vpc" {
  for_each   = var.vpc_configs
  source     = "./modules/vpc"
  name       = each.value.name
  cidr_block = each.value.cidr_block
}