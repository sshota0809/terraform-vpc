output "id" {
  value = "${aws_internet_gateway.module_vpc_internet_gateway.*.id}"
}
