output "id" {
  value = "${aws_route_table.module_vpc_route_table.*.id}"
}
