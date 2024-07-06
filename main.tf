# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "digitalocean_droplet" "digital-0" {
  image  = "ubuntu-22-04-x64"
  name       = "digital-0"
  region     = "sgp1"
  size       = "s-1vcpu-1gb"
  monitoring = true
  ipv6 = true
  tags = ["authentik"]
  ssh_keys = [
    data.digitalocean_ssh_key.freeman.id,
  ]
  user_data = <<EOT
  #cloud-config
  runcmd:
    - export doNetConf=y | curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect |  NIX_CHANNEL=nixos-24.05 PROVIDER=digitalocean doNetConf=y bash -x
  EOT
}

resource "cloudflare_zone" "autolife" {
  account_id = "2764ae0fd9a5cb92c9ac67708620e54c"
  zone       = "autolife-robotics.me"
}

resource "cloudflare_record" "vr_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "vr"
  value   = "14.154.194.93"
  type    = "A"
  proxied   = false
  ttl     = 3600
}

resource "cloudflare_record" "authentik_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "authentik"
  value   = "206.189.156.130"
  type    = "A"
  proxied = false
  ttl     = 3600
}
