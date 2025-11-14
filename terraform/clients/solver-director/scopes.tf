
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

    projects_write = {
      name                   = "projects:write"
      description            = "Scope for managing the user's projects"
      consent_screen_text    = "Manage currently active projects"
      gui_order              = 50
      role_ids               = {}
    }

    projects_read_all = {
      name                   = "projects:write-all"
      description            = "Scope for writing all the currently active projects of all users"
      consent_screen_text    = "Manage currently active projects for all users"
      gui_order              = 30
      role_ids               = {
        admin = local.roles.admin.id
      }
    }
  }
}

