output "id" {
  value = "${aws_nat_gateway.module_vpc_nat_gateway.*.id}"
}
