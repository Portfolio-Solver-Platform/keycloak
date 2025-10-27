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
}

module "third_party_app" {
  source = "./third-party-app/"
  realm_id = var.realm_id
}
