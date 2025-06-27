terraform {
  required_version = ">= 1.12.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "random_id" "bucket_id" {
  byte_length = 12
  prefix      = "tf-bucket-"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = random_id.bucket_id.hex
  tags = {
    Name = "Terraform S3 Bucket"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}