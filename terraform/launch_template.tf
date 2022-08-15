resource "aws_launch_template" "demo" {
  name = "demo"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 100
    }
  }

  image_id = "ami-045c09ab581c1ccd6"

  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web-security.id]

  user_data = filebase64("${path.module}/userdata.sh")

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }
}