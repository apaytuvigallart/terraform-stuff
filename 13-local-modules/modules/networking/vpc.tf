data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_vpc" "this" {
  cidr_block = var.vpc_config.cidr_block

  tags = {
    Name = var.vpc_config.name
  }
}

resource "aws_subnet" "this" {
  for_each          = var.subnet_config
  vpc_id            = aws_vpc.this.id
  availability_zone = each.value.az
  cidr_block        = each.value.cidr_block

  lifecycle {
    precondition {
      condition     = contains(data.aws_availability_zones.available.names, each.value.az)
      error_message = <<-EOT
      The availability zone specified for the subnet does not exist in the region.     
      Subnet key: ${each.key}
      Region: ${data.aws_availability_zones.available.id}
      Supported AZs: ${join(", ", data.aws_availability_zones.available.names)}
      Invalid AZ: ${each.value.az}
      EOT
    }
  }

  tags = {
    Name = each.key
  }
}

resource "aws_internet_gateway" "this" {
  for_each = { for k, config in var.subnet_config : k => config if config.public == true }
  vpc_id   = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_config.name}-${each.key}-igw"
  }
}

resource "aws_route_table" "this" {
  for_each = { for k, config in var.subnet_config : k => config if config.public == true }
  vpc_id   = aws_vpc.this.id

  tags = {
    Name = "${var.vpc_config.name}-${each.key}-rt"
  }
}

resource "aws_route_table_association" "this" {
  for_each       = { for k, config in var.subnet_config : k => config if config.public == true }
  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.this[each.key].id
}