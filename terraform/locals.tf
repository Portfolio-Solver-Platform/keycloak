locals {
  realm = keycloak_realm.psp
  is_development = var.environment == "dev"
  create_dev_users = local.is_development
}
