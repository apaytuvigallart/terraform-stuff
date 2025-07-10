variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-west-1"
}
# For this example, the EC2 instance Type won't use the default values from variables.tf, but the values from prod.auto.tfvars, unless you specify a different value when running terraform apply -var
variable "ec2_instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"

  validation {
    # we can also use contains(["t2.micro", "t3.micro"], var.ec2_instance_type)
    condition     = var.ec2_instance_type == "t2.micro" || var.ec2_instance_type == "t3.micro"
    error_message = "Only t2.micro and t3.micro instances are supported"
  }
}

# For this example, the EC2 volume configuration won't use the default values from variables.tf, but the values from terraform.tfvars, unless you specify a different value when running terraform apply -var
variable "ec2_volume_config" {
  description = "The size and type of the root block volume for EC2 instances."
  type = object({
    volume_type = string
    volume_size = number
  })
  default = {
    volume_type = "gp3"
    volume_size = 10
  }
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}

variable "my_sensitive_var" {
  type      = string
  sensitive = true
}