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

# for the sake of testing. It's quite dangerous to use a variable for the region
# as it can lead to resources being created in the wrong region if not set correctly, or simply forgetting to remove the resources.
provider "aws" {
  region = var.aws_region
}