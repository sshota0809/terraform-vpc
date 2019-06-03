variable "count" {
  type        = "string"
  description = "count of loop"
}

variable "route_table_id_list" {
  type        = "list"
  description = "route table id list of target"
}

variable "destination_nat_gateway_list" {
  type        = "list"
  description = "destination nat gateway list of target"
}
