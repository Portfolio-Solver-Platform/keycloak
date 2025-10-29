#!/usr/bin/env bash
KEYCLOAK_BOOTSTRAP_CLIENT_SECRET="${KEYCLOAK_BOOTSTRAP_CLIENT_SECRET:=admin}"

terraform -chdir=terraform init
terraform -chdir=terraform apply -auto-approve -var "bootstrap_service_client_secret=$KEYCLOAK_BOOTSTRAP_CLIENT_SECRET"

