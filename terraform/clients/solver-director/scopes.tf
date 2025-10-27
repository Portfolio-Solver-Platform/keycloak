resource "keycloak_openid_client_scope" "projects_read" {
  realm_id               = var.realm_id
  name                   = "solver-director:projects:read"
  description            = "Scope for reading the currently active projects"
  consent_screen_text    = "See currently active projects"
  include_in_token_scope = true
  gui_order              = 130
}


resource "keycloak_openid_client_scope" "projects_read_all" {
  realm_id               = var.realm_id
  name                   = "solver-director:projects:read-all"
  description            = "Scope for reading the currently active projects for everyone"
  consent_screen_text    = "See currently active projects for all users"
  include_in_token_scope = true
  gui_order              = 30
}
resource "keycloak_generic_role_mapper" "projects_read_all_admin_mapper" {
  realm_id        = var.realm_id
  client_scope_id = local.elevated_scopes.projects.read_all.id
  role_id         = local.roles.admin.id
}
