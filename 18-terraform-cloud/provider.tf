# terraform login
# terraform init
# terraform apply to create resources in the organization X and workspace Y

terraform {
  cloud {

    organization = "test-org"

    workspaces {
      name = "test-workspace"
    }
  }

  required_providers {

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}