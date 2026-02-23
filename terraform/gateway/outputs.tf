output "gateway_ipv4" {
  value = hcloud_server.gateway.ipv4_address
}

output "gateway_ipv6" {
  value = hcloud_server.gateway.ipv6_address
}