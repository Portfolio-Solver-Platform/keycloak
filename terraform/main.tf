
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

provider "kubernetes" {
  config_path = var.kubernetes_config_path
}

module "clients" {
  source = "./clients"
  realm_id = local.realm.id
  admin_app_secret = var.admin_app_secret
  kubernetes_platform_namespace = var.kubernetes_platform_namespace
  kubernetes_rabbitmq_namespace = var.kubernetes_rabbitmq_namespace
}

module "dev_users" {
  count = local.create_dev_users ? 1 : 0
  source = "./dev-users"
  realm_id = local.realm.id
  roles = module.clients.roles
}
