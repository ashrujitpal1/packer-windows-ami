provider "aws" {
  region = lookup(var.awsprops, "region")
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "ashrujit-terraform-state"

  # Prevent accidental deletion
  lifecycle {
    prevent_destroy = true
  }

  # Enable versioning
  versioning {
    enabled = true
  }

  #Enable server side encryption
  server_side_encryption_configuration {
    rule {
        apply_server_side_encryption_by_default {
            sse_algorithm = "AES256"
        }
    }
  }
}