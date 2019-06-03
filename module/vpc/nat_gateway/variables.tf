variable "count" {
  type        = "string"
  description = "count of loop"
}

variable "eip_id_list" {
  type        = "list"
  description = "eip id list of target"
}

variable "subnet_id_list" {
  type        = "list"
  description = "subnet id list of target"
}

variable "tag_list" {
  type        = "list"
  description = "tag list of nat gateway"
}
