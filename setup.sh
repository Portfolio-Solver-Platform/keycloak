#!/bin/sh
# Preconditions:
# - Kubernetes is up and running, and has ingress enabled (for minikube: `minikube addons enable ingress`).

kubectl apply -f ./keycloak.yaml
kubectl apply -f ./database.yaml
kubectl apply -f ./ingress.yaml
kubectl apply -f ./operator/keycloaks.yaml
kubectl apply -f ./operator/realms-imports.yaml
kubectl apply -f ./operator/kubernetes.yaml

