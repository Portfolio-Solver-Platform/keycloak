
module "scope" {
  source = "../scope"
  for_each = var.scopes

  realm_id = var.realm_id
  audience_client_id = var.audience_client_id

  scope = each.value
}

