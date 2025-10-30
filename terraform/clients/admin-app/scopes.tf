
resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = var.realm_id
  client_id = local.client.id

  optional_scopes = [
    var.scopes.solver_director.projects_read.name
    var.scopes.solver_director.projects_read_all.name
  ]
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = var.realm_id
  client_id = local.client.id

  default_scopes = []
}

