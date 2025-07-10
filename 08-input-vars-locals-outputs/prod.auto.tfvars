# *.auto.tfvars has higher preference than "terraform.tfvars" file.
# Careful if you have multiple "*.auto.tfvars" files. Files are processed in lexicographical (alphabetical) order by filename. 
# This means that, if you have multiple files, the last file processed wins and overrides any previous values.

ec2_instance_type = "t3.micro"
additional_tags = {
  ValuesFrom = "prod.auto.tfvars"
}