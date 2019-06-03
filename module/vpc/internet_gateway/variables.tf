variable "count" {
  type        = "string"
  description = "count of loop"
}

variable "vpc_id" {
  type        = "string"
  description = "vpc id of target"
}

variable "tag_list" {
  type        = "list"
  description = "tag list of vpc"
}
