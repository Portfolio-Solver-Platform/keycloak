resource "keycloak_openid_client" "client" {
  realm_id  = var.realm_id
  client_id = "admin-app"

  name    = "Admin App"
  enabled = true
  description = "The client used for the admin app"

  access_type = "CONFIDENTIAL"
  full_scope_allowed = false
  oauth2_device_authorization_grant_enabled = true
}
