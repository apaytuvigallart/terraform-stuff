terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}

resource "aws_s3_bucket" "bucket_demo" {
  bucket = var.bucket_name
  tags = {
    Name = "Terraform S3 Bucket :)"
  }

}

# managed somewhere else, we just want to use it in our project
data "aws_s3_bucket" "bucket_demo_external" {
  bucket = "terraform-bucket_demo_external"
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket to create"
  default     = "terraform-bucket_demo_external"
}

output "s3_bucket_id" {
  value = aws_s3_bucket.bucket_demo.id
}

locals {
  local_example = "test local variable"
}

module "module-example" {
  source = "./module-example"
}