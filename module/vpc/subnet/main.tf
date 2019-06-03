resource "aws_subnet" "module_vpc_subnet" {
  count             = "${var.count}"
  vpc_id            = "${var.vpc_id}"
  cidr_block        = "${lookup(var.subnet_list[count.index], "cidr_block")}"
  availability_zone = "${lookup(var.subnet_list[count.index], "availability_zone")}"
  tags              = "${var.tag_list[count.index]}"
}
