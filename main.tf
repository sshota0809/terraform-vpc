terraform {
  backend "s3" {
    bucket = "YOUR BUCKET NAME"
    key    = "YOUR OBJECT KEY"
    region = "YOUR REGION"
  }
}

provider "aws" {
  # access_key and secret_access_key is referenced by env(AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY)
  region = "ap-southeast-2"
}

##################
### deploy vpc ###
##################
module "vpc" {
  source = "./module/vpc/base"

  cidr_block = "${var.vpc_cidr_block}"
  tag        = "${var.vpc_tag}"
}

############################
### deploy public subnet ###
############################
module "vpc_public_subnet" {
  source = "./module/vpc/subnet"

  count       = "${length(var.vpc_public_subnet_list)}"
  vpc_id      = "${module.vpc.id}"
  subnet_list = "${var.vpc_public_subnet_list}"
  tag_list    = "${var.vpc_public_subnet_tag_list}"
}

#############################
### deploy private subnet ###
#############################
module "vpc_private_subnet" {
  source = "./module/vpc/subnet"

  count       = "${length(var.vpc_private_subnet_list)}"
  vpc_id      = "${module.vpc.id}"
  subnet_list = "${var.vpc_private_subnet_list}"
  tag_list    = "${var.vpc_private_subnet_tag_list}"
}

###############################
### deploy internet gateway ###
###############################
module "vpc_internet_gateway" {
  source = "./module/vpc/internet_gateway"

  count    = "${length(var.vpc_internet_gateway_tag_list)}"
  vpc_id   = "${module.vpc.id}"
  tag_list = "${var.vpc_internet_gateway_tag_list}"
}

##################
### deploy eip ###
##################
module "vpc_eip" {
  source = "./module/vpc/eip"

  count    = "${length(var.vpc_eip_tag_list)}"
  tag_list = "${var.vpc_eip_tag_list}"
}

##########################
### deploy nat gateway ###
##########################
module "vpc_nat_gateway" {
  source = "./module/vpc/nat_gateway"

  count          = "${length(var.vpc_eip_tag_list)}"
  eip_id_list    = "${module.vpc_eip.id}"
  subnet_id_list = "${module.vpc_public_subnet.id}"
  tag_list       = "${var.vpc_nat_gateway_tag_list}"
}

#################################
### deploy public route table ###
#################################
module "vpc_public_route_table" {
  source = "./module/vpc/route_table"

  count    = "${length(var.vpc_public_route_table_tag_list)}"
  vpc_id   = "${module.vpc.id}"
  tag_list = "${var.vpc_public_route_table_tag_list}"
}

##################################
### deploy private route table ###
##################################
module "vpc_private_route_table" {
  source = "./module/vpc/route_table"

  count    = "${length(var.vpc_private_route_table_tag_list)}"
  vpc_id   = "${module.vpc.id}"
  tag_list = "${var.vpc_private_route_table_tag_list}"
}

#####################################
### deploy route internet gateway ###
#####################################
module "vpc_public_route_internet_gateway" {
  source = "./module/vpc/route/gateway"

  count                    = "${length(var.vpc_public_route_table_tag_list)}"
  route_table_id_list      = "${module.vpc_public_route_table.id}"
  destination_gateway_list = "${module.vpc_internet_gateway.id}"
}

################################
### deploy route nat gateway ###
################################
module "vpc_private_route_nat_gateway" {
  source = "./module/vpc/route/nat_gateway"

  count                        = "${length(var.vpc_private_route_table_tag_list)}"
  route_table_id_list          = "${module.vpc_private_route_table.id}"
  destination_nat_gateway_list = "${module.vpc_nat_gateway.id}"
}

#######################################################
### deploy route table association of public subnet ###
#######################################################
module "vpc_public_route_tables_association" {
  source = "./module/vpc/route_table_association/one_to_many"

  count               = "${length(var.vpc_public_subnet_list)}"
  subnet_id_list      = "${module.vpc_public_subnet.id}"
  route_table_id_list = "${module.vpc_public_route_table.id}"
}

########################################################
### deploy route table association of private subnet ###
########################################################
module "vpc_private_route_tables_association" {
  source = "./module/vpc/route_table_association/one_to_one"

  count               = "${length(var.vpc_private_subnet_list)}"
  subnet_id_list      = "${module.vpc_private_subnet.id}"
  route_table_id_list = "${module.vpc_private_route_table.id}"
}
