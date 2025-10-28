#
# resource "keycloak_openid_audience_protocol_mapper" "audience_mappers" {
#   for_each        = local.scopes
#   realm_id        = var.realm_id
#   client_scope_id = each.value.id
#   name            = "solver-director-audience"
#
#   included_client_audience = local.client.client_id
# }
