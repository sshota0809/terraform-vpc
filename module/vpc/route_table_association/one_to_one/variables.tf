variable "count" {
  type        = "string"
  description = "count of loop"
}

variable "subnet_id_list" {
  type        = "list"
  description = "subnet id list of target"
}

variable "route_table_id_list" {
  type        = "list"
  description = "route table id list of vpc"
}
