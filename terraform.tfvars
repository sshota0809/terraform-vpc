vpc_cidr_block = "10.4.0.0/16"

vpc_tag = {
  Name = "test_vpc"
}

vpc_public_subnet_list = [
  {
    cidr_block = "10.4.0.0/24",
    availability_zone = "ap-southeast-2a"
  },
  {
    cidr_block = "10.4.1.0/24",
    availability_zone = "ap-southeast-2c"
  }
]

vpc_private_subnet_list = [
  {
    cidr_block = "10.4.2.0/24",
    availability_zone = "ap-southeast-2a"
  },
  {
    cidr_block = "10.4.3.0/24",
    availability_zone = "ap-southeast-2c"
  }
]

vpc_public_subnet_tag_list = [
  {
    Name = "public#1"
  },
  {
    Name = "public#2"
  }
]

vpc_private_subnet_tag_list = [
  {
    Name = "private#1"
  },
  {
    Name = "private#2"
  }
]

vpc_internet_gateway_tag_list = [
  {
    Name = "test_internet_gateway"
  }
]

vpc_eip_tag_list = [
  {
    Name = "eip#1"
  },
  {
    Name = "eip#2"
  }
]

vpc_nat_gateway_tag_list = [
  {
    Name = "ngw#1"
  },
  {
    Name = "ngw#2"
  }
]

vpc_public_route_table_tag_list = [
  {
    Name = "publicrt#1"
  }
]

vpc_private_route_table_tag_list = [
  {
    Name = "privatert#1"
  },
  {
    Name = "privatert#2"
  }
]
