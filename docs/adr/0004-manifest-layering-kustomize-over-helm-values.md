# 0004: Manifest layering strategy (Kustomize overlays over Helm values)

- Status: Accepted
- Date: 2026-02-27
- Owners: @wlodzimierrr

## Context

The workloads repository needs a consistent way to model dev/prod differences that remains easy to review and predictable for Argo CD path-based applications.

## Decision

Use Kustomize `base` + `envs/<environment>` overlays as the default layering strategy.
Use Helm values layering only as an exception for third-party chart consumption, while preserving deterministic environment paths.

## Alternatives considered

- Helm values layering for everything:
  - Pros: convenient for chart-centric apps.
  - Cons: weaker consistency for non-Helm manifests.
- Mixed per-app strategy:
  - Pros: local flexibility.
  - Cons: higher drift and onboarding cost.
- Kustomize overlays:
  - Pros: native support in Argo CD, clear env separation, straightforward diff-based promotion.
  - Cons: overlay patches must be managed to avoid duplication.

## Consequences

- Positive: each Argo CD application points to a single explicit env path.
- Positive: promotion is a Git diff from dev overlay intent to prod overlay intent.
- Tradeoff: requires convention discipline around overlay scope and patch size.
