resource "keycloak_openid_client" "client" {
  realm_id  = var.realm_id
  client_id = "solver-director"

  name    = "Solver Director client"
  enabled = true
  description = "The client for the solver director service"

  access_type = "CONFIDENTIAL"
  service_accounts_enabled = true
  standard_flow_enabled = false
  direct_access_grants_enabled = false
  full_scope_allowed = false
}
