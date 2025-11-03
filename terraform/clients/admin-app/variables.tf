
variable "realm_id" {
  description = "The Keycloak realm ID"
  type        = string
}

variable "scopes" {
  description = "The scopes for the various other clients"
  type = map(map(object({ name = string })))
}

variable "client_secret" {
  description = "The secret for the client"
  type = string
  sensitive = true
}
