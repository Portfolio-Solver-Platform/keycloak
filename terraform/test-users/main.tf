terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
    }
  }
}

resource "keycloak_user" "user" {
  realm_id   = var.realm_id
  username   = "user"

  email      = "user@user.com"
  first_name = "John"
  last_name  = "Doe"

  initial_password {
    value     = "user"
  }
}
