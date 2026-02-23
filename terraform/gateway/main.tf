resource "hcloud_ssh_key" "local_key" {
  name       = "${var.server_name}-admin"
  public_key = file(pathexpand(var.ssh_public_key_path))
}

resource "hcloud_firewall" "gateway_fw" {
  name = "${var.server_name}-fw"

  # SSH only from your IP
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = [var.admin_cidr]
  }

  # WireGuard from anywhere (VPN peers will come from random IPs)
  rule {
    direction  = "in"
    protocol   = "udp"
    port       = tostring(var.wireguard_port)
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  # Optional: allow ping (handy for troubleshooting)
  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = ["0.0.0.0/0", "::/0"]
  }
}