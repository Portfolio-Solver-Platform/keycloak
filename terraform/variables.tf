variable "keycloak_url" {
  description = "Base URL to Keycloak"
  type        = string
  default     = "http://keycloak.local"
}

variable "bootstrap_service_client_id" {
  description = "The ID of the bootstrap service client"
  type        = string
  default     = "bootstrap-admin"
}

variable "bootstrap_service_client_secret" {
  description = "The secret for the bootstrap service client"
  type        = string
  sensitive   = true
}

variable "admin_app_secret" {
  description = "The secret for the admin app client"
  type        = string
  sensitive   = true
}
