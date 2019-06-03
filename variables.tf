###########
### vpc ###
###########
variable "vpc_cidr_block" {
  type = "string"
  description = "cidr block of vpc"
}

variable "vpc_tag" {
  type = "map"
  description = "tag list of vpc"
}
#####################
### public subnet ###
#####################
variable "vpc_public_subnet_list" {
  type = "list"
  description = "cidr block and az list of public subnet"
}

variable "vpc_public_subnet_tag_list" {
  type = "list"
  description = "tag list of public subnet"
}

######################
### private subnet ###
######################
variable "vpc_private_subnet_list" {
  type = "list"
  description = "cidr block and az list of private subnet"
}

variable "vpc_private_subnet_tag_list" {
  type = "list"
  description = "tag list of private subnet"
}

########################
### internet gateway ###
########################
variable "vpc_internet_gateway_tag_list" {
  type = "list"
  description = "tag list of internet gateway"
}

###########
### eip ###
###########
variable "vpc_eip_tag_list" {
  type = "list"
  description = "tag list of eip"
}

###################
### nat gateway ###
###################
variable "vpc_nat_gateway_tag_list" {
  type = "list"
  description = "tag list of nat gateway"
}

##########################
### public route table ###
##########################
variable "vpc_public_route_table_tag_list" {
  type = "list"
  description = "tag list of public route table"
}

###########################
### private route table ###
###########################
variable "vpc_private_route_table_tag_list" {
  type = "list"
  description = "tag list of private route table"
}
