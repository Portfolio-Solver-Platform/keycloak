resource "keycloak_user" "admin" {
  realm_id   = var.realm_id
  username   = "admin"
  initial_password {
    value     = "admin"
  }

  email      = "admin@admin.com"
  first_name = "John Admin"
  last_name  = "Doe"
}

resource "keycloak_user_roles" "user_roles" {
  realm_id = var.realm_id
  user_id  = keycloak_user.admin.id

  role_ids = local.all_role_ids
}
