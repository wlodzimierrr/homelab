variable "hcloud_token" {
  type      = string
  sensitive = true
}

variable "server_name" {
  type    = string
  default = "gateway"
}

variable "location" {
  type    = string
  default = "nbg1" # e.g. fsn1, nbg1, hel1
}

variable "server_type" {
  type    = string
  default = "cpx21"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_ed25519_automation.pub"
}

# Your home/office public IP in CIDR form, for locking SSH down
# Example: "203.0.113.45/32"
variable "admin_cidr" {
  type = string
}

variable "wireguard_port" {
  type    = number
  default = 51820
}