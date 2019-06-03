variable "count" {
  type        = "string"
  description = "count of loop"
}

variable "route_table_id_list" {
  type        = "list"
  description = "route table id list of target"
}

variable "destination_gateway_list" {
  type        = "list"
  description = "destination gateway list of target"
}
