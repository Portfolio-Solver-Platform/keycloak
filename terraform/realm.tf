
resource "keycloak_realm" "psp" {
  realm        = "psp"
  enabled      = true
  display_name = "Portfolio Solver Platform"

  attributes = {
    "frontendUrl" = var.frontend_url
  }

  security_defenses {
    brute_force_detection {
      permanent_lockout                = false
      max_login_failures               = 5
      wait_increment_seconds           = 60
      quick_login_check_milli_seconds  = 1000
      minimum_quick_login_wait_seconds = 60
      max_failure_wait_seconds         = 900   # 15 minutes max lockout
      failure_reset_time_seconds       = 43200 # 12 hours
    }
  }

  registration_allowed = false
  reset_password_allowed = true # Since MFA is enabled, it is safe to allow them to reset the password themselves

  password_policy = var.enable_password_policy ? "length(14) and upperCase(1) and lowerCase(1) and digits(1) and specialChars(1) and forceExpiredPasswordChange(365) and notUsername and passwordHistory(5) and hashIterations(27500)"

  sso_session_idle_timeout         = "30m"
  sso_session_max_lifespan         = "10h"
  access_token_lifespan            = "5m" 
  access_token_lifespan_for_implicit_flow = "15m"
}

# Enable MFA
resource "keycloak_authentication_bindings" "realm_browser_binding" {
  count        = var.force_mfa ? 1 : 0

  realm_id     = keycloak_realm.psp.id
  browser_flow = keycloak_authentication_flow.browser_mfa.alias

  depends_on = [
    keycloak_authentication_execution.otp
  ]
}

# Explicitly set optional scopes (so we don't just use the default ones)
resource "keycloak_realm_optional_client_scopes" "optional_scopes" {
  realm_id        = local.realm.id
  optional_scopes = []
}

# Explicitly set default scopes (so we don't just use the default ones)
resource "keycloak_realm_default_client_scopes" "default_scopes" {
  realm_id       = local.realm.id
  default_scopes = []
}
