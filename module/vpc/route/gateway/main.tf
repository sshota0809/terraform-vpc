resource "aws_route" "module_vpc_route_gateway" {
  count = "${var.count}"
  route_table_id = "${element(var.route_table_id_list, count.index)}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${element(var.destination_gateway_list, count.index)}"
}
