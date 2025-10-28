variable "subnet" {
  description = "Subnet configuration"
  type = object({
    availability_zone = string
    cidr_block        = string
    name              = string
  })
}

variable "vpc_id" {
  
}
