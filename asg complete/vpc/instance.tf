resource "aws_instance" "demo" {
    ami = "ami-045c09ab581c1ccd6"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.vpc_main_public1.id
    vpc_security_group_ids = [aws_security_group.security_group1.id]

    key_name = "devops-keys"
}