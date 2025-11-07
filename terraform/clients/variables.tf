variable "realm_id" {
  description = "The Keycloak realm ID"
  type        = string
}

variable "admin_app_secret" {
  description = "The secret for the admin app client"
  type        = string
  sensitive   = true
}

variable "kubernetes_namespace" {
  description = "The Kubernetes namespace"
  type        = string
}
