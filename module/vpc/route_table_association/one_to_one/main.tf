resource "aws_route_table_association" "module_vpc_route_table_association_one_to_one" {
  count = "${var.count}"
  subnet_id = "${element(var.subnet_id_list, count.index)}"
  route_table_id = "${element(var.route_table_id_list, count.index)}"
}
