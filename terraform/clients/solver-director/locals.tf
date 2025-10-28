
locals {
  client = keycloak_openid_client.client

  roles = {
    admin = keycloak_role.admin
  }
}

