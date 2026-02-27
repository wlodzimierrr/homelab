# 0003: Secrets management strategy placeholder

- Status: Proposed
- Date: 2026-02-27
- Owners: @wlodzimierrr

## Context

The platform needs a secure, GitOps-compatible approach for managing Kubernetes secrets across environments.

The current repository uses encrypted Ansible Vault data for automation variables, but Kubernetes workload secret management standard is not finalized yet.

Roadmap work explicitly calls out a decision between SOPS and Sealed Secrets before broader workload rollout.

## Decision

Decision is deferred pending implementation spike. Shortlist remains:

- SOPS (with age/GPG and Git-encrypted manifests)
- Bitnami Sealed Secrets

This ADR acts as a placeholder so secret-management decision work is tracked explicitly.

## Alternatives considered

- SOPS: flexible tooling, file-level encryption in Git, integrates with multiple workflows.
- Sealed Secrets: Kubernetes-native controller flow, straightforward for cluster-bound secret sealing.
- External secret manager first (Vault/ESO): strongest separation and dynamic secrets potential, higher setup/ops cost for current phase.

## Consequences

- Positive: decision debt is explicit and visible.
- Tradeoff: delayed standardization can slow workload onboarding if prolonged.
- Follow-up: run a short spike and update this ADR to `Accepted` with migration guidance.
