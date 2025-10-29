
module "scopes" {
  realm_id = var.realm_id
  client_id = local.client.client_id
  source = "../scopes"

  scopes = {
    projects_read = {
      name                   = "projects:read"
      description            = "Scope for reading the currently active projects"
      consent_screen_text    = "See currently active projects"
      gui_order              = 130
      role_ids               = {}
    }

    projects_read_all = {
      name                   = "projects:read-all"
      description            = "Scope for reading the currently active projects of all users"
      consent_screen_text    = "See currently active projects for all users"
      gui_order              = 30
      role_ids               = {
        admin = local.roles.admin.id
      }
    }
  }
}

