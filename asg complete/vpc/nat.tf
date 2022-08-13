resource "aws_eip" "nat" {
  vpc = true
}

# AWS Nat Gateway
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.vpc_main_public1.id
  depends_on = [
    aws_internet_gateway.main-gw
  ]
}

#VPC setup for NAT Gateway
resource "aws_route_table" "private-main" {
  vpc_id = aws_vpc.vpc-main.id
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.nat-gw.id
  }

  tags = {
    "Name" = "private-main"
  }
}

# Association with the private subnets
resource "aws_route_table_association" "vpc_main_private1" {
  subnet_id = aws_subnet.vpc_main_private1.id
  route_table_id = aws_route_table.private-main.id
}

# Association with the private subnets
resource "aws_route_table_association" "vpc_main_private2" {
  subnet_id = aws_subnet.vpc_main_private2.id
  route_table_id = aws_route_table.private-main.id
}

# Association with the private subnets
resource "aws_route_table_association" "vpc_main_private3" {
  subnet_id = aws_subnet.vpc_main_private3.id
  route_table_id = aws_route_table.private-main.id
}