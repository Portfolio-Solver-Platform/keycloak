# Keycloak Configuration

This is the Keycloak configuration for [PSP](https://github.com/Portfolio-Solver-Platform).

> [!caution]
> Not for use in production yet!
>
> The following changes should be made before being production-ready:
> - Make Keycloak run in a separate namespace.
> - Replace the database with a production setup (in `database.yaml`).
> - Set up Ingress (in `ingress.yaml`).
> - Add TLS certificate for encrypted traffic (in `keycloak.yaml`).

## Usage 

Prerequisites:
- Have a Kubernetes cluster running.
- For minikube, also enable the Ingress addon: `minikube addons enable ingress`.
- Have kubectl set up for the Kubernetes cluster.

Execute the `setup.sh` script.
To access Keycloak, for now, in minikube, use `minikube service keycloak`.
