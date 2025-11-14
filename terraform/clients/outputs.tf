
output "scopes" {
  value = local.scopes
}

output "roles" {
  value = local.roles
}

output "rabbitmq_client_id" {
  value = module.rabbitmq.client_id
}

output "rabbitmq_client_secret" {
  value     = module.rabbitmq.client_secret
  sensitive = true
}
