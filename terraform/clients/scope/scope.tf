locals {
  scope = keycloak_openid_client_scope.scope
}

resource "keycloak_openid_client_scope" "scope" {
  realm_id               = var.realm_id
  name                   = var.scope.name
  description            = var.scope.description
  consent_screen_text    = var.scope.consent_screen_text
  include_in_token_scope = true
  gui_order              = var.scope.gui_order
}

resource "keycloak_openid_audience_protocol_mapper" "audience_mappers" {
  realm_id        = var.realm_id
  client_scope_id = local.scope.id
  name            = "client-audience"

  included_client_audience = var.audience_client_id
}
