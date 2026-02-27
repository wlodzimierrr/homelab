# 0001: Kubernetes distro and cluster topology (K3s HA)

- Status: Accepted
- Date: 2026-02-27
- Owners: @wlodzimierrr

## Context

This homelab needs a lightweight Kubernetes distribution that is easy to operate, supports high availability, and runs well on small nodes.

Current automation already provisions a 3-node control plane using the `k3s_ha` role and serial bootstrap:

- First server initialized with `--cluster-init`.
- Remaining servers join via API endpoint.
- Embedded etcd used for HA control plane state.
- Built-in `servicelb` is disabled to use MetalLB.

## Decision

Use K3s as the Kubernetes distribution with 3 server nodes in HA mode (embedded etcd), managed via Ansible playbooks and roles in this repository.

## Alternatives considered

- kubeadm-based Kubernetes: maximum flexibility, higher operational overhead.
- MicroK8s: simple for single-node/small setups, less aligned with existing Ansible workflow.
- Single-node K3s: simplest to run, but weaker availability and resiliency.

## Consequences

- Positive: lightweight, fast setup, and fits homelab constraints.
- Positive: current IaC already codifies this model, reducing drift.
- Tradeoff: K3s-specific behavior and defaults differ from some managed clusters.
- Follow-up: document backup/restore procedure for embedded etcd snapshots.
