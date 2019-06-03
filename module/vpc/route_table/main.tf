resource "aws_route_table" "module_vpc_route_table" {
  count  = "${var.count}"
  vpc_id = "${var.vpc_id}"
  tags   = "${var.tag_list[count.index]}"
}
