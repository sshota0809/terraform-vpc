resource "aws_vpc" "module_vpc" {
  cidr_block = "${var.cidr_block}"
  tags = "${var.tag}"
}
