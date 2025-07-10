locals {
  # arithmetic operators
  math = {
    sum            = 1 + 2
    subtraction    = 5 - 3
    multiplication = 4 * 2
    division       = 8 / 2
    modulo         = 10 % 3
  }

  # equality operators
  equality = {
    equal     = 5 == 5 # should return true
    not_equal = 5 != 3 # should return true
  }

  # comparison operators
  comparison = {
    greater_than          = 5 > 3  # should return true
    less_than             = 2 < 4  # should return true
    greater_than_or_equal = 5 >= 5 # should return true
    less_than_or_equal    = 3 <= 4 # should return true
  }

  # logical operators
  logical = {
    and = local.equality.equal && local.comparison.greater_than # should return true because both conditions are true
    or  = 5 == 2 || 3 == 3                                      # should return true because of the second condition
    not = !local.equality.equal                                 # should return false because the condition is true
  }

  double_numbers = [for number in var.numbers_list : number * 2]
  even_numbers   = [for number in var.numbers_list : number if number % 2 == 0]
  firstnames     = [for person in var.objects_list : person.firstname]
  fullnames      = [for person in var.objects_list : "${person.firstname} ${person.lastname}"]

  doubles_map = { for key, value in var.numbers_map : key => value * 2 }
  even_map    = { for key, value in var.numbers_map : key => value * 2 if value % 2 == 0 }

  # using ellipsis (...) to enable grouping under the same key in case the key appears multiple times
  users_map  = { for user in var.users : user.username => user.role... }
  users_map2 = { for user, roles in local.users_map : user => { roles = roles } }

  # We can also use usernames_from_map = keys(local.users_map) instead of manually creating the list!
  usernames_from_map = [for user, role in local.users_map : user]
}