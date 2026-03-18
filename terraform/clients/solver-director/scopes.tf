
module "scopes" {
  realm_id  = var.realm_id
  client_id = local.client.client_id
  source    = "../scopes"

  scopes = {
    projects_read = {
      name                = "projects:read"
      description         = "Scope for reading the currently active projects"
      consent_screen_text = "See currently active projects"
      gui_order           = 130
      role_ids            = {}
    }

    projects_read_all = {
      name                = "projects:read-all"
      description         = "Scope for reading the currently active projects of all users"
      consent_screen_text = "See currently active projects for all users"
      gui_order           = 30
      role_ids = {
        admin = local.roles.admin.id
      }
    }

    projects_write = {
      name                = "projects:write"
      description         = "Scope for managing the user's projects"
      consent_screen_text = "Manage currently active projects"
      gui_order           = 120
      role_ids            = {}
    }

    projects_write_all = {
      name                = "projects:write-all"
      description         = "Scope for writing all the currently active projects of all users"
      consent_screen_text = "Manage currently active projects for all users"
      gui_order           = 20
      role_ids = {
        admin = local.roles.admin.id
      }
    }

    solvers_read = {
      name                = "solvers:read"
      description         = "Scope for reading available solvers"
      consent_screen_text = "See available solvers"
      gui_order           = 80
      role_ids            = {}
    }

    solvers_write = {
      name                = "solvers:write"
      description         = "Scope for managing solvers"
      consent_screen_text = "Manage solvers"
      gui_order           = 75
      role_ids = {
        admin = local.roles.admin.id
      }
    }

    groups_read = {
      name                = "groups:read"
      description         = "Scope for reading solver groups"
      consent_screen_text = "See solver groups"
      gui_order           = 70
      role_ids            = {}
    }

    groups_write = {
      name                = "groups:write"
      description         = "Scope for managing solver groups"
      consent_screen_text = "Manage solver groups"
      gui_order           = 65
      role_ids = {
        admin = local.roles.admin.id
      }
    }

    problems_read = {
      name                = "problems:read"
      description         = "Scope for reading problems and instances"
      consent_screen_text = "See available problems"
      gui_order           = 60
      role_ids            = {}
    }

    problems_write = {
      name                = "problems:write"
      description         = "Scope for managing problems and instances"
      consent_screen_text = "Manage problems"
      gui_order           = 55
      role_ids = {
        admin = local.roles.admin.id
      }
    }

    resources_read = {
      name                = "resources:read"
      description         = "Scope for reading own resource limits and usage"
      consent_screen_text = "See your resource limits"
      gui_order           = 50
      role_ids            = {}
    }

    resources_write = {
      name                = "resources:write"
      description         = "Scope for managing global and per-user resource limits"
      consent_screen_text = "Manage resource limits"
      gui_order           = 45
      role_ids = {
        admin = local.roles.admin.id
      }
    }
  }
}

