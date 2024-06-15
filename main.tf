# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "digitalocean_droplet" "digital-1" {
  #  image      = "128792213" //nixos-image
  image  = "ubuntu-22-04-x64"
  name       = "digital-1"
  region     = "sgp1"
  size       = "s-1vcpu-1gb"
  monitoring = true
  ssh_keys = [
    data.digitalocean_ssh_key.freeman.id,
  ]
  user_data = <<EOT
  #cloud-config
  runcmd:
    - export doNetConf=y  | curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect |  NIX_CHANNEL=nixos-24.05 PROVIDER=digitalocean doNetConf=y bash -x
  EOT
}
