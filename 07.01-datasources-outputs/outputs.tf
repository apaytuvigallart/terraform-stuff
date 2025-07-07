output "identity_id" {
  value = data.aws_caller_identity.current_identity.account_id
}

output "current_region" {
  value = data.aws_region.current_region.id
}

output "current_region_us_east_1" {
  value = data.aws_region.current_region_us_east_1.id
}

output "console_managed" {
  value = data.aws_vpc.console_managed.id
}

output "read_access" {
  value = data.aws_iam_policy_document.read_access.json
}
