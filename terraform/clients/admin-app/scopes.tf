
resource "keycloak_openid_client_optional_scopes" "client_optional_scopes" {
  realm_id  = var.realm_id
  client_id = local.client.id

  optional_scopes = [
    var.scopes.solver_director.projects_read.name,
    var.scopes.solver_director.projects_read_all.name,
    var.scopes.solver_director.solvers_read.name,
    var.scopes.solver_director.solvers_write.name,
    var.scopes.solver_director.groups_read.name,
    var.scopes.solver_director.groups_write.name,
    var.scopes.solver_director.problems_read.name,
    var.scopes.solver_director.problems_write.name,
    var.scopes.solver_director.resources_read.name,
    var.scopes.solver_director.resources_write.name,
  ]
}

resource "keycloak_openid_client_default_scopes" "client_default_scopes" {
  realm_id  = var.realm_id
  client_id = local.client.id

  default_scopes = ["basic"]
}

