terraform {
  backend "s3" {
    bucket = "ashrujit-terraform-state"
    key = "demo-asg-terraform.tfstate"
    region = "us-east-1"
  }
}