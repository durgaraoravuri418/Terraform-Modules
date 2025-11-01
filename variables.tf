variable "vpc_configs" {
  type = map(object({
    name       = string
    cidr_block = string
  }))
}

variable "public_subnet_configs" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
}

variable "private_subnet_configs" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))

}

variable "key_pair_configs" {
  type = map(object({
    key_name = string
  }))

}

variable "sg_configs" {
  description = "Map of Security Group configurations"
  type = map(object({
    name                = string
    description         = string
    vpc_id              = string
    ingress_from_port   = number
    ingress_to_port     = number
    ingress_protocol    = string
    ingress_cidr_blocks = list(string)
    egress_from_port    = number
    egress_to_port      = number
    egress_protocol     = string
    egress_cidr_blocks  = list(string)
    tags                = map(string)
  }))
}
