
variable "environment" {
  type        = string
  description = "Deployment environment"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be dev or prod."
  }
}

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

variable "kubernetes_namespace" {
  description = "The Kubernetes namespace"
  type        = string
  default     = "psp"
}

variable "rabbitmq_namespace" {
  description = "The Kubernetes namespace for RabbitMQ"
  type        = string
  default     = "rabbit-mq"
}

variable "kubernetes_config_path" {
  description = "Path to kubeconfig"
  type        = string
}

