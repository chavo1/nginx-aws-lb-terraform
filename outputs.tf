output "aws_security_group" {
  value = "${aws_security_group.internet.*.id}"
}

output "private_subnet" {
  value = "${aws_subnet.private.*.id}"
}

output "public_subnet" {
  value = "${aws_subnet.public.*.id}"
}
output "vpc" {
  value = "${aws_vpc.nginx-vpc.*.id}"
}

output "rtb" {
  value = "${aws_route_table.public.*.id}"
}
output "private_subnet_cidr" {
  value = "${aws_subnet.private.cidr_block}"
}
output "public_subnet_cidr" {
  value = "${aws_subnet.public.cidr_block}"
}
output "nat_gateway_private_ip" {
  value = "${aws_nat_gateway.nat_gw.private_ip}"
}
output "aws_internet_gateway" {
  value = "${aws_internet_gateway.internet_gw.id}"
}