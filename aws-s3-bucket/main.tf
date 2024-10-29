# Terraform configuration
provider "aws" {
  region = "us-east-1"
}

# S3 backend
# terraform {
#   backend "s3" {
#     bucket         = "tf-backend-bucket"
#     key            = "path/to/terraform.tfstate"
#     dynamodb_table = "terraform-lock-table"
#     encrypt        = true
#   }
# }

# S3 bucket
resource "aws_s3_bucket" "tf_bucket" {
  bucket = "tf-backend-bucket"

  tags = {
    Name        = "TF Bucket"
    Environment = "Dev"
  }
}
