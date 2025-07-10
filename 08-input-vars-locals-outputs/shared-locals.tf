locals {
  common_tags = {
    project       = "08-input-vars-locals-outputs"
    project_owner = "terraform-course"
    cost_center   = "1234"
    managed_by    = "Terraform"
    sensitive_tag = var.my_sensitive_var
  }
}