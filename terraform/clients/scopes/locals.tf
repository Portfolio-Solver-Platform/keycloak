locals {
  scopes = {for k,v in module.scope : k => v.scope}
}
