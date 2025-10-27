
locals {
  scopes = {
    projects = {
      read = keycloak_openid_client_scope.projects_read
    }
  }

  elevated_scopes = {
    projects = {
      read_all = keycloak_openid_client_scope.projects_read_all
    }
  }

  roles = {
    admin = keycloak_role.admin
  }
}

