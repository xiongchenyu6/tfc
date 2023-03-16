# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# output "instance_ami" {
#   value = aws_instance.ubuntu.ami
# }

output "ssh_public_key" {
  value = data.digitalocean_ssh_key.office.public_key
}

output "ssh_public_fingerprint" {
  value = data.digitalocean_ssh_key.office.fingerprint
}

output "ip" {
  value = digitalocean_droplet.digital-1.ipv4_address
}
