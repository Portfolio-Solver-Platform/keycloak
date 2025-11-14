resource "keycloak_openid_client" "client" {
  realm_id  = var.realm_id
  client_id = "rabbitmq"

  name        = "RabbitMQ"
  enabled     = true
  description = "OAuth2 client for RabbitMQ message broker"

  access_type              = "CONFIDENTIAL"
  service_accounts_enabled = true
  standard_flow_enabled    = false
  direct_access_grants_enabled = false

  full_scope_allowed = false
}
