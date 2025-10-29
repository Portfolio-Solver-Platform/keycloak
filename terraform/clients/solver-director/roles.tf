resource "keycloak_role" "admin" {
  realm_id    = var.realm_id
  client_id   = local.client.id
  name        = "admin"
  description = "Administrator"
}
