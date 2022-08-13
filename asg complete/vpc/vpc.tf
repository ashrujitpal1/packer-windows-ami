# Creating VPC
resource "aws_vpc" "vpc-main" {
    cidr_block = "192.168.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
      "Name" = "vpc-main"
    }
}

# Creating Public Subnet
resource "aws_subnet" "vpc_main_public1" {
  vpc_id = aws_vpc.vpc-main.id
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "vpc-main-public1"
  }
}

# Creating Public Subnet
resource "aws_subnet" "vpc_main_public2" {
  vpc_id = aws_vpc.vpc-main.id
  cidr_block = "192.168.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "vpc-main-public2"
  }
}

# Creating Public Subnet
resource "aws_subnet" "vpc_main_public3" {
  vpc_id = aws_vpc.vpc-main.id
  cidr_block = "192.168.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1c"
  tags = {
    "Name" = "vpc-main-public3"
  }
}

# Creating Private Subnet
resource "aws_subnet" "vpc_main_private1" {
  vpc_id = aws_vpc.vpc-main.id
  cidr_block = "192.168.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"
  tags = {
    "Name" = "vpc-main-private1"
  }
}

# Creating Private Subnet
resource "aws_subnet" "vpc_main_private2" {
  vpc_id = aws_vpc.vpc-main.id
  cidr_block = "192.168.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"
  tags = {
    "Name" = "vpc-main-private2"
  }
}

# Creating Private Subnet
resource "aws_subnet" "vpc_main_private3" {
  vpc_id = aws_vpc.vpc-main.id
  cidr_block = "192.168.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1c"
  tags = {
    "Name" = "vpc-main-private3"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main-gw" {
    vpc_id = aws_vpc.vpc-main.id
    
    tags = {
      "Name" = "gateway-main"
    }
}

# Create Routing Table
resource "aws_route_table" "main-public" {
  vpc_id = aws_vpc.vpc-main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-gw.id
  }

  tags = {
    "Name" = "main-public"
  }
}

# Route associated public subnets
resource "aws_route_table_association" "public-main-2" {
  subnet_id = aws_subnet.vpc_main_public2.id
  route_table_id = aws_route_table.main-public.id
}

# Route associated public subnets
resource "aws_route_table_association" "public-main-1" {
  subnet_id = aws_subnet.vpc_main_public1.id
  route_table_id = aws_route_table.main-public.id
}

# Route associated public subnets
resource "aws_route_table_association" "public-main-3" {
  subnet_id = aws_subnet.vpc_main_public3.id
  route_table_id = aws_route_table.main-public.id
}
