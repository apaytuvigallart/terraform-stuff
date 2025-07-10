# Variable Precedence Order
Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

- Environment variables (lowest precedence), such as `TF_VAR_ec2_instance_type="t3.micro"`
- The `terraform.tfvars` file, if present.
- The `terraform.tfvars.json` file, if present.
- Any `*.auto.tfvars` or `*.auto.tfvars.json` files, processed in lexical order of their filenames.
- Any `-var` and `-var-file` options on the command line, in the order they are provided. (This includes variables set by an HCP Terraform workspace.) (highest precedence)

In this example, the EC2's Instance Type would be `t3.4xlarge`

```
terraform apply -var=ec2_instance_type="t3.xlarge" -var=ec2_instance_type="t3.4xlarge"
```

In this example, the EC2's Instance would have a new tag, `test` as key, `test_123` as value. The EC2's `root_block_device` volume size would be 100 rather than 15 and `gp3` rather than `gp2`. This is because any `-var` and `-var-file` options on the comand line have a higher precedence than `terraform.tfvars` file.

```
terraform apply -var 'additional_tags={"test"="test_123"}' -var 'ec2_volume_config={"volume_size":100, "volume_type":"gp3"}'
```