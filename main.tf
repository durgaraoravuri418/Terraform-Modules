module "aws_vpc" {
  for_each   = var.vpc_configs
  source     = "./modules/vpc"
  name       = each.value.name
  cidr_block = each.value.cidr_block
}

module "aws_public_subnet" {
  source            = "./modules/public_subnet"
  for_each          = var.public_subnet_configs
  vpc_id            = module.aws_vpc["My_Vpc_01"].vpc_id
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.cidr_block
  name              = each.value.name
  depends_on        = [module.aws_vpc]
}

module "aws_private_subnet" {
  source            = "./modules/private_subnet"
  for_each          = var.private_subnet_configs
  vpc_id            = module.aws_vpc["My_Vpc_01"].vpc_id
  availability_zone = each.value.availability_zone
  cidr_block        = each.value.cidr_block
  name              = each.value.name
  depends_on        = [module.aws_public_subnet]
}

module "keypair_module" {
  source   = "./modules/keypair"
  for_each = var.key_pair_configs
  keyname  = each.value.key_name
}


module "security_group" {
  for_each = var.sg_configs
  source   = "./modules/securitygroup"

  name                = each.value.name
  description         = each.value.description
  vpc_id              = module.aws_vpc["My_Vpc_01"].vpc_id
  ingress_from_port   = each.value.ingress_from_port
  ingress_to_port     = each.value.ingress_to_port
  ingress_protocol    = each.value.ingress_protocol
  ingress_cidr_blocks = each.value.ingress_cidr_blocks
  egress_from_port    = each.value.egress_from_port
  egress_to_port      = each.value.egress_to_port
  egress_protocol     = each.value.egress_protocol
  egress_cidr_blocks  = each.value.egress_cidr_blocks
  tags                = each.value.tags
}



