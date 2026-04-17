#!/usr/bin/env bash

if [ "$1" = "dev" ]; then
  echo "Using default development options, unless overridden by environment variables..."

  ENVIRONMENT="${ENVIRONMENT:-dev}"
  KEYCLOAK_BOOTSTRAP_CLIENT_ID="${KEYCLOAK_BOOTSTRAP_CLIENT_ID:-tofu-runner}"
  KEYCLOAK_BOOTSTRAP_CLIENT_SECRET="${KEYCLOAK_BOOTSTRAP_CLIENT_SECRET:-admin}"
  ADMIN_APP_CLIENT_SECRET="${ADMIN_APP_CLIENT_SECRET:-admin}"
  KEYCLOAK_URL="${KEYCLOAK_URL:-http://keycloak.local}"
  FRONTEND_URL="${KEYCLOAK_URL}"
  KUBECONFIG="${KUBECONFIG:-~/.kube/config}"
  ENABLE_PASSWORD_POLICY="${ENABLE_PASSWORD_POLICY:-false}"
  FORCE_MFA="${FORCE_MFA:-false}"
fi

terraform -chdir=terraform init
terraform -chdir=terraform apply -auto-approve \
    -var "environment=$ENVIRONMENT"\
    -var "bootstrap_service_client_id=$KEYCLOAK_BOOTSTRAP_CLIENT_ID"\
    -var "bootstrap_service_client_secret=$KEYCLOAK_BOOTSTRAP_CLIENT_SECRET"\
    -var "admin_app_secret=$ADMIN_APP_CLIENT_SECRET"\
    -var "keycloak_url=$KEYCLOAK_URL"\
    -var "frontend_url=$FRONTEND_URL"\
    -var "enable_password_policy=$ENABLE_PASSWORD_POLICY"\
    -var "force_mfa=$FORCE_MFA"\
    -var "kubernetes_config_path=$KUBECONFIG"

