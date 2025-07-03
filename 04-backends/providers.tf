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
  backend "s3" {
    bucket = "my-test-bucket-terraform-123"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}