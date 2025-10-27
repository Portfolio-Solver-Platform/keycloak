resource "keycloak_openid_client" "client" {
    realm_id  = var.realm_id
    client_id = "solver-director"

    name    = "Solver Director client"
    enabled = true
    description = "The client for the solver director service"

    access_type           = "CONFIDENTIAL"
}
