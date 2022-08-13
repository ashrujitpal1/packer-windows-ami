terraform {
  backend "s3" {
        bucket = "ashrujit-terraform-state"
        key = "state/terraform.tfstate"
        region = "us-east-1"
    }
}


