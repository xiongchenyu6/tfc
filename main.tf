# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "digitalocean_droplet" "digital-1" {
  #  image      = "128792213" //nixos-image
  image  = "debian-11-x64"
  name       = "digital-1"
  region     = "sgp1"
  size       = "s-1vcpu-1gb"
  monitoring = false
  ssh_keys = [
    data.digitalocean_ssh_key.freeman.id,
  ]
  user_data = <<EOT
  #cloud-config
  runcmd:
    - curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=nixos-24.11 bash -x
  EOT
}

