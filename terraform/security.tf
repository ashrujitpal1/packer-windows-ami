resource "aws_security_group" "web-security" {
    name = "webserver-securitygroup"
    vpc_id = "vpc-08cfb7245d8b33cfc"
    
    ingress {
      cidr_blocks = ["0.0.0.0/0"]
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
  }

  ingress {
      cidr_blocks = ["0.0.0.0/0"]
      from_port = 22
      to_port = 22
      protocol = "tcp"
  }

  egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
  
}