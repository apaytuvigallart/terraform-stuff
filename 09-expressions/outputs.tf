output "operators" {
  value = {
    math       = local.math
    equality   = local.equality
    comparison = local.comparison
    logical    = local.logical
  }
}

output "double_numbers" {
  value = local.double_numbers
}
output "even_numbers" {
  value = local.even_numbers
}
output "firstnames" {
  value = local.firstnames
}
output "fullnames" {
  value = local.fullnames
}
output "doubles_map" {
  value = local.doubles_map
}
output "even_map" {
  value = local.even_map
}
output "users_map" {
  value = local.users_map
}
output "users_map2" {
  value = local.users_map2
}
output "user_roles_to_output" {
  value = local.users_map2[var.user_to_output].roles
}
output "usernames_from_map" {
  value = local.usernames_from_map
}