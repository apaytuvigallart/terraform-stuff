# processed automatically by Terraform

ec2_instance_type = "t2.micro"

ec2_volume_config = {
  volume_size = 15
  volume_type = "gp2"
}

additional_tags = {
  ValuesFrom = "terraform.tfvars"
}