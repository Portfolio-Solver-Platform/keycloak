resource "keycloak_openid_client" "client" {
  realm_id  = var.realm_id
  client_id = "third-party-app"

  name    = "Third-party app"
  enabled = true
  description = "The client used by third-party apps/services"

  consent_required = false # TODO: Set to true when example client is ready for device authorization
  display_on_consent_screen = true
  consent_screen_text = "This is a third-party app and is NOT affiliated with PSP. Make sure you trust them before granting them access. Use at your own risk."

  access_type = "PUBLIC"
  full_scope_allowed = false
  direct_access_grants_enabled = true
  oauth2_device_authorization_grant_enabled = true
}
