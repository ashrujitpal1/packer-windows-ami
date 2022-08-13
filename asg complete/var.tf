variable "awsprops" {
  type = map
  default = {
      region = "us-east-1"
      ami = "ami-045c09ab581c1ccd6"
      instance_type = "t2.micro"
      subnet = "subnet-0820b2d09794f06a9"
      keyname = "devops-keys"
      secgroupname = "terraform-ec2-sg"
      publicip = true
      vpc1 = "vpc-08cfb7245d8b33cfc"
  }
}

