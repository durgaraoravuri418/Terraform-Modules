resource "aws_vpc" "cloudshift_network" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.name
  }
}