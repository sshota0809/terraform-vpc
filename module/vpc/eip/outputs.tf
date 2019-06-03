output "id" {
  value = "${aws_eip.module_vpc_eip.*.id}"
}
