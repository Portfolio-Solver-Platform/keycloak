resource "keycloak_openid_client" "client" {
  realm_id  = var.realm_id
  client_id = "admin-app"
  # Use write-only (wo) secret
  # To update, increment the wo_version
  client_secret_wo = var.client_secret
  client_secret_wo_version = 1

  name    = "Admin App"
  enabled = true
  description = "The client used for the admin app"

  access_type = "CONFIDENTIAL"
  full_scope_allowed = false
  oauth2_device_authorization_grant_enabled = true
}
