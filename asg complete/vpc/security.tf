resource "aws_security_group" "security_group1" {
    vpc_id = aws_vpc.vpc-main.id
    name = "vpc-main-security-group1"
    description = "security group allows ssh"
    
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 22
      protocol = "tcp"
      to_port = 22
    } 

    tags = {
      "Name" = "security-group1"
    }
}