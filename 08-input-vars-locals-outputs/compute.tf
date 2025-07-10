data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical's official Ubuntu AMIs

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "instance_test" {
  ami               = data.aws_ami.ubuntu.id
  availability_zone = "${var.aws_region}a" # Use the first availability zone in the specified region
  instance_type     = var.ec2_instance_type
  root_block_device {
    volume_size           = var.ec2_volume_config.volume_size
    volume_type           = var.ec2_volume_config.volume_type
    delete_on_termination = true
  }
  tags = merge(
    {
      Name = "InstanceTest"
    },
    local.common_tags,
    var.additional_tags
  )
}