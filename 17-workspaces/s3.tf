# terraform workspace new dev => This creates and switches to "dev" workspace
# stuff that you create in this workspace will be isolated from other workspaces. What you create in "dev" can be seen in terraformtfstate.d/dev/terraform.tfstate file

# given that we have a .tfvars for each workspace, we can use the -var-file argument to load the correct variables for each workspace
# terraform apply -var-file=$(terraform workspaces show).tfvars

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  count  = var.bucket_count
  bucket = "my-tf-test-bucket-${terraform.workspace}-${count.index}-${random_id.bucket_suffix.hex}"
}