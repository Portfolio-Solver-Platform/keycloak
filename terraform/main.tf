
terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
      version = "5.5.0"
    }
  }
}

provider "keycloak" {
  client_id     = var.bootstrap_service_client_id
  client_secret = var.bootstrap_service_client_secret
  url           = var.keycloak_url
}

module "clients" {
  source = "./clients"
  realm_id = local.realm.id
  admin_app_secret = var.admin_app_secret
}
