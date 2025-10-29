
module "scope" {
  source = "../scope"
  for_each = var.scopes

  realm_id = var.realm_id
  client_id = var.client_id

  scope = each.value
}

