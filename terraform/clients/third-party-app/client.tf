resource "keycloak_openid_client" "client" {
  realm_id  = var.realm_id
  client_id = "third-party-app"

  name    = "Third-party app"
  enabled = true
  description = "The client used by third-party apps/services"

  access_type           = "PUBLIC"
  direct_access_grants_enabled = true
  oauth2_device_authorization_grant_enabled = true
}
