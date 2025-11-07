
resource "kubernetes_secret" "solver_director_auth_client" {
  metadata {
    name      = var.kubernetes_client_secret_name
    namespace = var.kubernetes_namespace
  }

  data = {
    id     = local.client.client_id
    secret = local.client.client_secret
  }

  type = "Opaque"
}

resource "kubernetes_role" "client_secret_reader" {
  metadata {
    name      = "${var.kubernetes_client_secret_name}-reader"
    namespace = var.kubernetes_namespace
  }

  rule {
    api_groups     = [""]
    resources      = ["secrets"]
    resource_names = [var.kubernetes_client_secret_name]
    verbs          = ["get", "list"]
  }
}

resource "kubernetes_role_binding" "client_secret_reader" {
  metadata {
    name      = "${var.kubernetes_client_secret_name}-reader"
    namespace = var.kubernetes_namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.client_secret_reader.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = var.kubernetes_service_account_name
    namespace = var.kubernetes_namespace
  }
}

