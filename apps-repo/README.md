# Homelab GitOps Apps Repository Skeleton

This directory is a starter layout for a dedicated manifests repository.

## Layout

- `bootstrap/`: Argo CD bootstrap objects (AppProject, root apps).
- `platform/`: shared platform components managed by GitOps.
- `apps/`: workload application manifests.
- `environments/`: environment-level Argo CD app sets (dev/prod).

## Argo CD target paths

Use these exact paths in Argo CD `spec.source.path`.

| Purpose | Path |
|---|---|
| Root app (dev) | `environments/dev` |
| Root app (prod) | `environments/prod` |
| Platform (dev) | `platform/envs/dev` |
| Platform (prod) | `platform/envs/prod` |
| Homelab API (dev) | `apps/homelab-api/envs/dev` |
| Homelab API (prod) | `apps/homelab-api/envs/prod` |
| Homelab Web (dev) | `apps/homelab-web/envs/dev` |
| Homelab Web (prod) | `apps/homelab-web/envs/prod` |

## Bootstrapping sequence

1. Apply `bootstrap/project-homelab.yaml`.
2. Apply one root app:
   - `bootstrap/root-app-dev.yaml`, or
   - `bootstrap/root-app-prod.yaml`.

## Notes

- `repoURL` is intentionally a placeholder in example Applications. Replace it with your dedicated repo URL.
- Environment folders use Kustomize overlays for clear, explicit promotion boundaries.
