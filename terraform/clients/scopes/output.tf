output "scopes" {
  value = local.scopes
}

output "public_scopes" {
  value = {
    for k,v in local.scopes : k => v
    if length(var.scopes[k].role_ids) == 0
  }
}

output "elevated_scopes" {
  value = {
    for k,v in local.scopes : k => v
    if length(var.scopes[k].role_ids) > 0
  }
}
