A networking module that should:
1. Create a VPC with a given CIDR block
2. Allow the user to provide the configuration for multiple subnets: 
    2.1 The user should be able to provide CIDR blocks 
    2.2 The user should be able to provide AWS AZ 
    2.3 The user should be able to mark a subnet as public or private 
        2.3.1 If at least one subnet is public, we need to deploy an IGW 
        2.3.2 We need to associate the public subnets with a public RTB

Example usage:
```
module "networking" {
  source = "./modules/networking"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your-vpc"
  }
  subnet_config = {
    subnet_1 = {
      cidr_block = "10.0.1.0/24"
      az         = "eu-west-1a"
    }
    subnet_2 = {
      cidr_block = "10.0.2.0/24"
      az         = "eu-west-1b"
      public     = true
    }
  }
}
```