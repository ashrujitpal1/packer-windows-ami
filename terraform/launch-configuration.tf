resource "aws_launch_configuration" "demo" {
    image_id = "ami-0022f774911c1d690"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web-security.id]
    key_name = "devops-keys"

    user_data = <<-EOF
                    #!/bin/bash
                    sudo yum update
                    sudo curl https://www.rpmfind.net/linux/epel/next/8/Everything/x86_64/Packages/b/busybox-1.35.0-2.el8.next.x86_64.rpm --output busybox.rpm
                    sudo yum install busybox.rpm iasl -y
                    echo "You are learning Terraform, Have a good day" > index.html
                    nohup busybox httpd -f -p 8080 &
                EOF
    
    lifecycle {
      create_before_destroy = true
    }
}