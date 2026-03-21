# Harbor on OpenShift (Helm Wrapper Chart)

![Harbor Logo](https://goharbor.io/img/logos/harbor-logo.png)

## What is Harbor?

Harbor is an open-source container registry that secures, stores, and
manages container images and Helm charts.

It provides: - RBAC - Vulnerability scanning - Image signing -
Replication - Audit logs

## Problem This Solves

Harbor is used here as an **image cache / private registry**:

-   Avoid Docker Hub rate limits
-   Faster image pulls inside cluster
-   Centralized internal registry
-   Secure image distribution

## Architecture

Openshift-harbor-chart/ - charts/harbor (dependency) - templates (SCC,
SA, Route, RBAC) - values.yaml - Chart.yaml

## Deployment

### Build dependencies

helm dependency build .

### Install

helm install harbor . -n `<namespace>`{=html} -f values.yaml

### Upgrade

helm upgrade harbor . -n `<namespace>`{=html} -f values.yaml

## Values

All Harbor values go under:

harbor: expose: type: clusterIP

## Secret Management

Azure Key Vault -\> ExternalSecret -\> Kubernetes Secret -\> Harbor

## Notes

-   Admin password only applied on first startup
-   SCC required for OpenShift
-   NGINX must use correct ServiceAccount

## References

https://goharbor.io/docs/ https://github.com/goharbor/harbor-helm
https://github.com/goharbor/harbor
