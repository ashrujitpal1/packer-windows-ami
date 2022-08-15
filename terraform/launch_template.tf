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

  user_data = <<-EOF
                    #!/bin/bash
                    sudo yum update
                    sudo curl https://www.rpmfind.net/linux/epel/next/8/Everything/x86_64/Packages/b/busybox-1.35.0-2.el8.next.x86_64.rpm --output busybox.rpm
                    sudo yum install busybox.rpm iasl -y
                    echo "You are learning Terraform, Have a good day" > index.html
                    nohup busybox httpd -f -p 8080 &
                EOF
}