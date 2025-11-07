#!/usr/bin/env bash

if [ "$1" = "dev" ]; then
  echo "Using default development options, unless overridden by environment variables..."

  ENVIRONMENT="${ENVIRONMENT:-dev}"
  KEYCLOAK_BOOTSTRAP_CLIENT_SECRET="${KEYCLOAK_BOOTSTRAP_CLIENT_SECRET:-admin}"
  ADMIN_APP_CLIENT_SECRET="${ADMIN_APP_CLIENT_SECRET:-admin}"
  KEYCLOAK_URL="${KEYCLOAK_URL:-http://keycloak.local}"
  KUBECONFIG="${KUBECONFIG:-~/.kube/config}"
fi

terraform -chdir=terraform init
terraform -chdir=terraform apply -auto-approve \
    -var "environment=$ENVIRONMENT"\
    -var "bootstrap_service_client_secret=$KEYCLOAK_BOOTSTRAP_CLIENT_SECRET"\
    -var "admin_app_secret=$ADMIN_APP_CLIENT_SECRET"\
    -var "keycloak_url=$KEYCLOAK_URL"\
    -var "kubernetes_config_path=$KUBECONFIG"

