resource "aws_security_group" "terraform-ec2-sg" {
    name = lookup(var.awsprops, "secgroupname")
    description = "Security group for the EC2"
    vpc_id = lookup(var.awsprops, "vpc1")

    // To allow SSH transport
    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    } 

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "backend_demo" {
  ami = lookup(var.awsprops, "ami")
  subnet_id = lookup(var.awsprops, "subnet")
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.terraform-ec2-sg.id] 
  key_name = lookup(var.awsprops, "keyname")
}