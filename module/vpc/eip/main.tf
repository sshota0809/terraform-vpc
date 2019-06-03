resource "aws_eip" "module_vpc_eip" {
  count = "${var.count}"
  vpc = true
  tags = "${var.tag_list[count.index]}"
}
