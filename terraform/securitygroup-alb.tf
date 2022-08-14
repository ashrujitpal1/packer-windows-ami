resource "aws_security_group" "alb" {
    name = "webservre-securitygroup-alb"
    vpc_id = "vpc-08cfb7245d8b33cfc"

    ingress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    egress {
        cidr_blocks = ["0.0.0.0/0"]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
}