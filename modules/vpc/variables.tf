variable "cidr_block" {
  description = "VPC cidr block"
  type = string
  default = "10.16.0.0/16"
}

variable "vpc_name" {
    description = "vpc name"
    type = string
    default = "my_vpc"
  
}