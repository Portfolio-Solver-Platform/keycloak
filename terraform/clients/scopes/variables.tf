variable "realm_id" {
  description = "Keycloak realm ID"
  type        = string
}

variable "audience_client_id" {
  description = "The Keycloak client ID of the audience"
  type        = string
}

variable "scopes" {
  description = "The settings for the scopes. See the ../scope module documentation."
  type = map(any)
}
