terraform {
  required_providers {
    keycloak = {
      source = "keycloak/keycloak"
    }
  }
}

module "solver_director" {
  source = "./solver-director/"
  realm_id = var.realm_id
  kubernetes_namespace = var.kubernetes_platform_namespace
}

module "third_party_app" {
  source = "./third-party-app/"
  realm_id = var.realm_id
  scopes = local.scopes
}

module "admin_app" {
  source = "./admin-app/"
  realm_id = var.realm_id
  client_secret = var.admin_app_secret
  scopes = local.scopes
}

module "rabbitmq" {
  source = "./rabbitmq/"
  realm_id = var.realm_id
  kubernetes_namespace = var.kubernetes_rabbitmq_namespace
}
