variable "vpc_configs" {
  type = map(object({
    name       = string
    cidr_block = string
  }))
}

variable "public_subnet_configs" {
  type = map(object({
    name = string
    cidr_block = string 
    availability_zone = string
  }))
}

variable "private_subnet_configs" {
  type = map(object({
    name = string
    cidr_block = string 
    availability_zone = string
  }))
  
}

variable "key_pair_configs" {
  type = map(object({
    key_name = string
  }))
  
}
