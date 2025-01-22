# Copyright (c) HashiCorp,p Inc.
# SPDX-License-Identifier: MPL-2.0

# resource "digitalocean_droplet" "digital-0" {
#   image  = "ubuntu-24-04-x64"
#   name       = "digital-0"
#   region     = "sgp1"
#   size       = "s-2vcpu-2gb"
#   monitoring = true
#   ipv6 = true
#   tags = ["authentik"]
#   ssh_keys = [
#     data.digitalocean_ssh_key.freeman.id,
#   ]
#   user_data = <<EOT
#   #cloud-config
#   runcmd:
#     - export doNetConf=y | curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect |  NIX_CHANNEL=nixos-24.11 PROVIDER=digitalocean doNetConf=y bash -x
#   EOT
# }

resource "cloudflare_zone" "autolife" {
  account = {
   id = "2764ae0fd9a5cb92c9ac67708620e54c" 
  }
  name      = "autolife-robotics.me"
}

resource "cloudflare_zone" "autolife-tech" {
  account = {
   id = "2764ae0fd9a5cb92c9ac67708620e54c" 
  }
  name       = "auto-life.tech"
}

resource "cloudflare_zone" "autolife-ai" {
  account = {
   id = "2764ae0fd9a5cb92c9ac67708620e54c" 
  }
  name       = "autolife.ai"
}

resource "cloudflare_dns_record" "mail-www" {
  zone_id = cloudflare_zone.autolife-tech.id
  name    = "auto-life.tech"
  content   = "43.156.66.157" # huoshan cloud
  type    = "A"
  proxied   = false
  ttl     = 1
}

resource "cloudflare_dns_record" "netbird_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "netbird"
  content   = "47.128.253.85"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "frp_dashboard_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "frp-dashboard"
  content   = "47.128.253.85"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "vr_sg_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "vr-sg"
  content   = "47.128.253.85"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "rust-server_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "rust-server"
  content   = "47.128.253.85"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "mngt_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "mngt"
  content   = "47.128.253.85"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "www_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "www"
  content   = "47.128.253.85"
  type    = "A"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "mainpage_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "autolife-robotics.me"
  content   = "47.128.253.85"
  type    = "A"
  proxied = true
  ttl     = 1
}
