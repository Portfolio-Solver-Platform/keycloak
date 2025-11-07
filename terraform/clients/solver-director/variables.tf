
variable "realm_id" {
  description = "The Keycloak realm ID"
  type        = string
}

variable "kubernetes_namespace" {
  description = "The Kubernetes namespace"
  type        = string
}

variable "kubernetes_service_account_name" {
  description = "The Kubernetes service account name for solver-director"
  type        = string
  default     = "solver-director"
}

variable "kubernetes_client_secret_name" {
  description = "The name of the Kubernetes secret that contains the client credentials"
  type        = string
  default     = "solver-director-auth-client"
}


