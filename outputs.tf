output "vpc_id" {
  value = "${module.vpc.id}"
}

output "vpc_public_subnet_id" {
  value = "${module.vpc_public_subnet.id}"
}

output "vpc_private_subnet_id" {
  value = "${module.vpc_private_subnet.id}"
}

output "vpc_internet_gateway_id" {
  value = "${module.vpc_internet_gateway.id}"
}

output "vpc_eip_id" {
  value = "${module.vpc_eip.id}"
}

output "vpc_nat_gateway_id" {
  value = "${module.vpc_nat_gateway.id}"
}

output "vpc_public_route_table_id" {
  value = "${module.vpc_public_route_table.id}"
}

output "vpc_private_route_table_id" {
  value = "${module.vpc_private_route_table.id}"
}

output "vpc_public_route_internet_gateway_id" {
  value = "${module.vpc_public_route_internet_gateway.id}"
}

output "vpc_private_route_nat_gateway_id" {
  value = "${module.vpc_private_route_nat_gateway.id}"
}

output "vpc_public_route_tables_association" {
  value = "${module.vpc_public_route_tables_association.id}"
}

output "vpc_private_route_tables_association" {
  value = "${module.vpc_private_route_tables_association.id}"
}
