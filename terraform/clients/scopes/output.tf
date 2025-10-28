output "scopes" {
  value = {for k,v in module.scope : k => v.scope}
}
