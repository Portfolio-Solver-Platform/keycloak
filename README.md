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

This section will describe how to apply the Keycloak configuration
so you can have a corresponding Keycloak instance running on Kubernetes.

> [!important]
> For now, in minikube, once Keycloak is set up, you have to use
> `minikube service keycloak` to access it.

### Helm

This section will describe how to run Keycloak with this configuration using [helm](https://helm.sh/).

Prerequisites:
- Have a Kubernetes cluster running.
- For minikube, also enable the Ingress addon: `minikube addons enable ingress`.
- Have kubectl set up for the Kubernetes cluster.

Run `helm install keycloak .` in the root of this repository.

