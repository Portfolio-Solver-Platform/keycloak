resource "keycloak_openid_client_scope" "projects_read" {
  realm_id               = var.realm_id
  name                   = "solver-director:projects:read"
  description            = "Scope for reading the currently active projects"
  consent_screen_text    = "See currently active projects"
  include_in_token_scope = true
  gui_order              = 10
}

