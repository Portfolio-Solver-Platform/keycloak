
locals {
  all_roles = flatten([for roles in values(var.roles) : values(roles)])
  all_role_ids = [for role in local.all_roles : role.id]
}

