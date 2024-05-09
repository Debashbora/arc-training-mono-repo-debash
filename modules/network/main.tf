terraform {
  required_version = "~> 1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  #   backend "s3" {}
}

provider "aws" {
  region = var.region
}

resource "aws_vpc" "poc_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "poc_vpc"
  }
}

resource "aws_network_acl" "poc_nacl" {
  vpc_id = aws_vpc.poc_vpc.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "poc_nacl"
  }
}

resource "aws_internet_gateway" "poc_igw" {
  vpc_id = aws_vpc.poc_vpc.id

  tags = {
    Name = "poc_igw"
  }
}

resource "aws_eip" "poc_eip" {
  count  = length(var.public_cidrs)
  domain = "vpc"
}

resource "aws_nat_gateway" "poc_natgw" {
  count         = length(var.public_cidrs)
  allocation_id = element(aws_eip.poc_eip[*].id, count.index)
  subnet_id     = element(aws_subnet.poc_public_subnets[*].id, count.index)

  tags = {
    Name = "poc_natgw-${count.index + 1}"
  }
}

resource "aws_subnet" "poc_public_subnets" {
  count                   = length(var.public_cidrs)
  vpc_id                  = aws_vpc.poc_vpc.id
  cidr_block              = element(var.public_cidrs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "poc_subnet_public${count.index + 1}"
  }
}

resource "aws_subnet" "poc_private_subnets" {
  count      = length(var.private_cidrs)
  vpc_id     = aws_vpc.poc_vpc.id
  cidr_block = element(var.private_cidrs, count.index)
  tags = {
    Name = "poc_subnet_private${count.index + 1}"
  }
}
resource "aws_route_table" "poc_public_rtb" {

  vpc_id = aws_vpc.poc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.poc_igw.id
  }

  tags = {
    Name = "poc_public_rtb"
  }
}
resource "aws_route_table" "poc_private_rtbs" {
  count  = length(var.private_cidrs)
  vpc_id = aws_vpc.poc_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.poc_natgw[*].id, count.index)
  }

  tags = {
    Name = "poc_private_rtb${count.index + 1}"
  }
}


resource "aws_route_table_association" "poc_public_rtb_association" {
  count          = length(var.public_cidrs)
  subnet_id      = element(aws_subnet.poc_public_subnets[*].id, count.index)
  route_table_id = aws_route_table.poc_public_rtb.id
}

resource "aws_route_table_association" "poc_private_rtb_association" {
  count          = length(var.private_cidrs)
  subnet_id      = element(aws_subnet.poc_private_subnets[*].id, count.index)
  route_table_id = element(aws_route_table.poc_private_rtbs[*].id, count.index)
}

resource "aws_network_acl_association" "poc_private_nacl_association" {
  count          = length(var.private_cidrs)
  network_acl_id = aws_network_acl.poc_nacl.id
  subnet_id      = element(aws_subnet.poc_private_subnets[*].id, count.index)
}
resource "aws_network_acl_association" "poc_public_nacl_association" {
  count          = length(var.public_cidrs)
  network_acl_id = aws_network_acl.poc_nacl.id
  subnet_id      = element(aws_subnet.poc_public_subnets[*].id, count.index)
}
