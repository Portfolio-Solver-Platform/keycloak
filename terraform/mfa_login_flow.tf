resource "keycloak_authentication_flow" "browser_mfa" {
  realm_id    = keycloak_realm.psp.id
  alias       = "browser-mfa-enforced"
  description = "Browser flow with mandatory OTP"
}

resource "keycloak_authentication_execution" "cookie" {
  realm_id          = keycloak_realm.psp.id
  parent_flow_alias = keycloak_authentication_flow.browser_mfa.alias
  authenticator     = "auth-cookie"
  requirement       = "ALTERNATIVE"
}

resource "keycloak_authentication_subflow" "forms" {
  realm_id          = keycloak_realm.psp.id
  parent_flow_alias = keycloak_authentication_flow.browser_mfa.alias
  alias             = "mfa-forms-subflow"
  provider_id       = "basic-flow"
  requirement       = "ALTERNATIVE"

  depends_on = [keycloak_authentication_execution.cookie]
}

resource "keycloak_authentication_execution" "username_password" {
  realm_id          = keycloak_realm.psp.id
  parent_flow_alias = keycloak_authentication_subflow.forms.alias
  authenticator     = "auth-username-password-form"
  requirement       = "REQUIRED"
}

resource "keycloak_authentication_execution" "otp" {
  realm_id          = keycloak_realm.psp.id
  parent_flow_alias = keycloak_authentication_subflow.forms.alias
  authenticator     = "auth-otp-form"
  requirement       = "REQUIRED" 

  depends_on = [keycloak_authentication_execution.username_password]
}

resource "keycloak_required_action" "configure_totp" {
  realm_id       = keycloak_realm.psp.id
  alias          = "CONFIGURE_TOTP"
  enabled        = true
  default_action = false 
  name           = "Configure OTP"
}
