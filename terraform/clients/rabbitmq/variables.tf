variable "realm_id" {
  description = "The ID of the realm"
  type        = string
}

variable "kubernetes_namespace" {
  description = "The Kubernetes namespace for RabbitMQ"
  type        = string
}


variable "kubernetes_service_account_name" {
  description = "The Kubernetes service account name for rabbitmq"
  type        = string
  default     = "rabbitmq"
}

variable "kubernetes_client_secret_name" {
  description = "The name of the Kubernetes secret that contains the client credentials"
  type        = string
  default     = "rabbitmq-auth-client"
}

