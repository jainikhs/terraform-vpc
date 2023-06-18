resource "aws_vpc" "prod_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"
  #instance_tenancy = "true"
  tags = {
    name = "prod-vpc"
  }
}

resource "aws_subnet" "prod_subnet_public-1" {
  vpc_id = "${aws_vpc.prod_vpc.id}"
  cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "ap-south-1a"
    tags = {
        name = "prod-subnet-public-1"
    }
}