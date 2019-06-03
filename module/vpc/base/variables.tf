variable "cidr_block" {
  type        = "string"
  description = "cidr block of vpc"
}

variable "tag" {
  type        = "map"
  description = "tag list of vpc"
}
