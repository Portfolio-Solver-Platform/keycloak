# Keycloak Configuration

This is the [Keycloak](https://www.keycloak.org/) configuration for [PSP](https://github.com/Portfolio-Solver-Platform).
Keycloak handles all user data, authentication and authorisation.

> [!caution]
> Not for use in production yet!
>
> The following changes should be made before being production-ready:
> - Replace the database with a production setup (in `database.yaml`).
> - Make the secrets different (and not publicly available) in production settings.

## Deployment

This section will describe how to apply the Keycloak configuration so you can have a corresponding Keycloak instance running on Kubernetes.

### Prerequisites

Before continuing with this guide, you need to:
- Have a Kubernetes cluster running.
- Have `kubectl` set up for the Kubernetes cluster.

### Deploy

1. Deploy Keycloak
   - Development environment: `skaffold dev` in the root of this repository
   - Production/staging environment: `skaffold run -p prod` in the root of this repository
2. Wait for Keycloak to deploy. The `skaffold` command finishes before Keycloak completes deployment, so you have to wait until it is done.
3. Apply Keycloak configuration
   - Development environment: `./apply-terraform.sh dev`
   - Production/staging environment: `./apply-terraform.sh` after you have set the environment variables that are used in the script.
