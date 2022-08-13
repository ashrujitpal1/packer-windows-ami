resource "aws_launch_configuration" "demo" {
    image_id = "ami-0ceb587ab0954eb74"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web-security.id]
    key_name = "devops-keys"
    
    lifecycle {
      create_before_destroy = true
    }
}