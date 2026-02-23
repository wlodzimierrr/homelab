resource "hcloud_server" "gateway" {
  name        = var.server_name
  image       = "debian-12"
  server_type = var.server_type
  location    = var.location

  ssh_keys = [hcloud_ssh_key.local_key.id]

  firewall_ids = [hcloud_firewall.gateway_fw.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  labels = {
    role = "gateway"
  }
}