resource "aws_internet_gateway" "module_vpc_internet_gateway" {
  count  = "${var.count}"
  vpc_id = "${var.vpc_id}"
  tags   = "${var.tag_list[count.index]}"
}
