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
  account_id = "2764ae0fd9a5cb92c9ac67708620e54c"
  zone       = "autolife-robotics.me"
}
resource "cloudflare_zone" "autolife-tech" {
  account_id = "2764ae0fd9a5cb92c9ac67708620e54c"
  zone       = "auto-life.tech"
}

resource "cloudflare_zone" "autolife-ai" {
  account_id = "2764ae0fd9a5cb92c9ac67708620e54c"
  zone       = "autolife.ai"
}

resource "cloudflare_record" "vr_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "vr"
  value   = "101.126.131.81"
  type    = "A"
  proxied   = false
  ttl     = 1
}

resource "cloudflare_record" "netbird_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "netbird"
  value   = "43.198.90.76"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_record" "frp_dashboard_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "frp-dashboard"
  value   = "43.198.90.76"
  type    = "A"
  proxied = false
  ttl     = 1
}


resource "cloudflare_record" "vr_sg_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "vr-sg"
  value   = "43.198.90.76"
  type    = "A"
  proxied = false
  ttl     = 1
}


resource "cloudflare_record" "mngt_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "mngt"
  value   = "43.198.90.76"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_record" "www_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "www"
  value   = "43.198.90.76"
  type    = "A"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "mainpage_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "autolife-robotics.me"
  value   = "43.198.90.76"
  type    = "A"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "mainpage_autolife_ai" {
  zone_id = "effd528990cab2cbfbce7bd9c1590a8d"
  name    = "autolife.ai"
  value   = "www-6qq.pages.dev"
  type    = "CNAME"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "www_mainpage_autolife_ai" {
  zone_id = "effd528990cab2cbfbce7bd9c1590a8d"
  name    = "www"
  value   = "www-6qq.pages.dev"
  type    = "A"
  proxied = true
  ttl     = 1
}
