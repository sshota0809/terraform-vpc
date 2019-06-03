resource "aws_nat_gateway" "module_vpc_nat_gateway" {
  count = "${var.count}"
  allocation_id = "${element(var.eip_id_list, count.index)}"
  subnet_id = "${element(var.subnet_id_list, count.index)}"
  tags = "${var.tag_list[count.index]}"
}
