
resource "keycloak_realm" "psp" {
  realm = "psp"
  enabled = true
  display_name = "PSP realm"
}

# Explicitly set optional scopes (so we don't just use the default ones)
resource "keycloak_realm_optional_client_scopes" "optional_scopes" {
  realm_id  = local.realm.id
  optional_scopes = []
}

# Explicitly set default scopes (so we don't just use the default ones)
resource "keycloak_realm_default_client_scopes" "default_scopes" {
  realm_id  = local.realm.id
  default_scopes = []
}
