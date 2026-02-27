# 0002: GitOps controller and structure (Argo CD)

- Status: Accepted
- Date: 2026-02-27
- Owners: @wlodzimierrr

## Context

The platform requires declarative delivery with clear reconciliation behavior and minimal manual kubectl operations.

Current repository automation installs and configures Argo CD through Ansible:

- Argo CD installed from upstream manifests pinned by version.
- Exposed through Traefik ingress with TLS.
- RBAC and local account controls are codified.
- Network policy and security-context hardening are supported.

The roadmap defines an App-of-Apps bootstrap structure as the target model for managing platform and workload applications.

## Decision

Use Argo CD as the GitOps controller and adopt the App-of-Apps structure as the standard model for cluster state management.

## Alternatives considered

- FluxCD: strong GitOps feature set, but would require rework of current setup and operational model.
- Direct Helm/Ansible-only deploys: simpler initially, weaker reconciliation and drift control.
- Argo CD without App-of-Apps: usable, but less scalable for grouping and bootstrap clarity.

## Consequences

- Positive: continuous reconciliation and auditable desired state.
- Positive: aligns with existing role-based setup in this repository.
- Tradeoff: operational dependency on Argo CD availability and configuration quality.
- Follow-up: implement and document root/child app manifests for full App-of-Apps bootstrap.
