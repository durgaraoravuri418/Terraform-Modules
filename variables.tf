variable "vpc_configs" {
  type = map(object({
    name       = string
    cidr_block = string
  }))
}
