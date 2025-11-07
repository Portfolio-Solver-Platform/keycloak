
resource "kubernetes_secret" "solver_director_auth_client" {
  metadata {
    name      = "solver-director-auth-client"
    namespace = var.namespace
  }

  data = {
    id     = local.client.client_id
    secret = local.client.client_secret
  }

  type = "Opaque"
}

resource "kubernetes_role" "client_secret_reader" {
  metadata {
    name      = "solver-director-auth-client-secret-reader"
    namespace = var.namespace
  }

  rule {
    api_groups     = [""]
    resources      = ["secrets"]
    resource_names = ["solver-director-auth-client"]
    verbs          = ["get", "list"]
  }
}

resource "kubernetes_role_binding" "client_secret_reader" {
  metadata {
    name      = "solver-director-auth-client-secret-reader"
    namespace = var.namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.client_secret_reader.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = "solver-director"
    namespace = var.namespace
  }
}

