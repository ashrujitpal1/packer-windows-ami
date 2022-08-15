resource "aws_launch_template" "demo" {
  name = "demo"

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = 10
    }
  }

  image_id = "ami-0022f774911c1d690"

  instance_initiated_shutdown_behavior = "terminate"

  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web-security.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }
}