variable "name"                { type = string }
variable "description"         { type = string }
variable "vpc_id"              { }

variable "ingress_from_port"   { type = number }
variable "ingress_to_port"     { type = number }
variable "ingress_protocol"    { type = string }
variable "ingress_cidr_blocks" { type = list(string) }

variable "egress_from_port"    { type = number }
variable "egress_to_port"      { type = number }
variable "egress_protocol"     { type = string }
variable "egress_cidr_blocks"  { type = list(string) }

variable "tags" {
  type    = map(string)
  default = {}
}
