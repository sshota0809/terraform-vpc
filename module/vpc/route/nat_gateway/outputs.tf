output "id" {
  value = "${aws_route.module_vpc_route_nat_gateway.*.id}"
}
