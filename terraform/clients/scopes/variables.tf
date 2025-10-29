variable "realm_id" {
  description = "Keycloak realm ID"
  type        = string
}

variable "client_id" {
  description = "The Keycloak client ID of the audience"
  type        = string
}

variable "scopes" {
  description = "The settings for the scopes. Each key-value pair is a scope, where the key is only for local readability. For the value, see the scope module documentation."
  type = map(any)
}
