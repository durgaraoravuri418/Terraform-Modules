module "aws_vpc" {
  for_each = var.vpc_configs
  source = "./modules/vpc"
  name = each.value.name
  cidr_block = each.value.cidr_block
}

module "aws_public_subnet" {
  source = "./modules/public_subnet"
  for_each = var.public_subnet_configs
  vpc_id = module.aws_vpc["My_Vpc_01"].vpc_id
  availability_zone = each.value.availability_zone
  cidr_block = each.value.cidr_block
  name = each.value.name
  depends_on = [module.aws_vpc]
}

module "aws_private_subnet" {
  source = "./modules/private_subnet"
  for_each = var.private_subnet_configs
  vpc_id = module.aws_vpc["My_Vpc_01"].vpc_id
  subnet = each.value
  depends_on = [module.aws_public_subnet]
}



