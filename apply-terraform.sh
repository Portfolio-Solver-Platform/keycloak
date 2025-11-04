#!/usr/bin/env bash
KEYCLOAK_BOOTSTRAP_CLIENT_SECRET="${KEYCLOAK_BOOTSTRAP_CLIENT_SECRET:=admin}"
ADMIN_APP_CLIENT_SECRET="${ADMIN_APP_CLIENT_SECRET:=admin}"

terraform -chdir=terraform init
terraform -chdir=terraform apply -auto-approve -var "bootstrap_service_client_secret=$KEYCLOAK_BOOTSTRAP_CLIENT_SECRET" -var "admin_app_secret=$ADMIN_APP_CLIENT_SECRET"

