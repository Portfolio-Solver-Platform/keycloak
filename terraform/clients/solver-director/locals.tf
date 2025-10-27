
locals {
  scopes = {
    projects = {
      read = keycloak_openid_client_scope.projects_read
    }
  }
}

