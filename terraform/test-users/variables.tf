
variable "realm_id" {
  description = "The Keycloak realm ID"
  type        = string
}

variable "roles" {
  description = "The roles for the clients"
  type = map(map(object({ name = string })))
}

