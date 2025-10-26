# Keycloak Configuration

This is the [Keycloak](https://www.keycloak.org/) configuration for [PSP](https://github.com/Portfolio-Solver-Platform).
Keycloak handles all user data, authentication and authorisation.

> [!caution]
> Not for use in production yet!
>
> The following changes should be made before being production-ready:
> - Replace the database with a production setup (in `database.yaml`).

## Deployment

This section will describe how to apply the Keycloak configuration
so you can have a corresponding Keycloak instance running on Kubernetes.

How to use this deployment guide:
1. First, see the [Prerequisites](#prerequisites).
2. Deploy using [Skaffold](#skaffold).

### Prerequisites

Before continuing with this guide, you need to:
- Have a Kubernetes cluster running.
- Have kubectl set up for the Kubernetes cluster.

### Skaffold

This section describes how to deploy Keycloak in Kubernetes using [Skaffold](https://skaffold.dev/).

In the root of this repository:
- For development environment: run `skaffold dev`
- For production/staging environment: run `skaffold run -p prod`
