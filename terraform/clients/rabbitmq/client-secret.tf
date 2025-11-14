resource "kubernetes_secret" "auth_client" {
  metadata {
    name      = "rabbitmq-auth-client"
    namespace = var.kubernetes_namespace
  }

  data = {
    id     = keycloak_openid_client.client.client_id
    secret = keycloak_openid_client.client.client_secret
  }

  type = "Opaque"
}

resource "kubernetes_role" "auth_client_reader" {
  metadata {
    name      = "rabbitmq-auth-client-reader"
    namespace = var.kubernetes_namespace
  }

  rule {
    api_groups     = [""]
    resources      = ["secrets"]
    resource_names = [kubernetes_secret.auth_client.metadata[0].name]
    verbs          = ["get"]
  }
}

resource "kubernetes_role_binding" "auth_client_reader" {
  metadata {
    name      = "rabbitmq-auth-client-reader"
    namespace = var.kubernetes_namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.auth_client_reader.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = var.kubernetes_namespace
  }
}
