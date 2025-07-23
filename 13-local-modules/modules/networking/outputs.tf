locals {
  public_subnets = {
    for k, config in var.subnet_config : k => config if config.public
  }
  private_subnets = {
    for k, config in var.subnet_config : k => config if !config.public
  }
  output_public_subnets = { for k, config in local.public_subnets : k => {
    "subnet_id"         = aws_subnet.this[k].id
    "availability_zone" = aws_subnet.this[k].availability_zone
    }
  }
  output_private_subnets = { for k, config in local.private_subnets : k => {
    "subnet_id"         = aws_subnet.this[k].id
    "availability_zone" = aws_subnet.this[k].availability_zone
    }
  }
}
output "vpc_cidr" {
  value = var.vpc_config
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = local.output_public_subnets
}

output "private_subnets" {
  value = local.output_private_subnets
}