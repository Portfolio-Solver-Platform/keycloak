resource "keycloak_role" "admin" {
  realm_id    = var.realm_id
  name        = "admin"
  description = "Administrator"
}
