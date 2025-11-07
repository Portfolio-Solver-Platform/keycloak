resource "keycloak_user" "user" {
  realm_id   = var.realm_id
  username   = "user"
  initial_password {
    value     = "user"
  }

  email      = "user@user.com"
  first_name = "John"
  last_name  = "Doe"
}
