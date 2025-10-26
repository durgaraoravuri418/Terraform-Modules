resource "aws_vpc" "cloudshift_network" {
  cidr_block = var.cidr_block
  tags = {
    name = var.vpc_name
  }
}