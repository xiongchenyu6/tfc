# Copyright (c) HashiCorp,p Inc.
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
    - export doNetConf=y | curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect |  NIX_CHANNEL=nixos-24.11 PROVIDER=digitalocean doNetConf=y bash -x
  EOT
}

resource "cloudflare_zone" "autolife" {
  account_id = "2764ae0fd9a5cb92c9ac67708620e54c"
  zone       = "autolife-robotics.me"
}

# resource "cloudflare_zone" "autolife-ai" {
#   account_id = "9dcccca5dd36961792570374be029ae4"
#   zone       = "autolife.ai"
# }

resource "cloudflare_record" "vr_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "vr"
  value   = "14.154.190.192"
  type    = "A"
  proxied   = false
  ttl     = 3600
}

resource "cloudflare_record" "netbird_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "netbird"
  value   = "43.199.189.188"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_record" "frp_dashboard_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "frp-dashboard"
  value   = "43.199.189.188"
  type    = "A"
  proxied = false
  ttl     = 1
}


resource "cloudflare_record" "vr_sg_udp_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "vr-sg-udp"
  value   = "43.199.189.188"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_record" "vr_sg_udp_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "vr-sg-udp"
  value   = "43.199.189.188"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_record" "robot_match_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "robot-match"
  value   = "43.199.189.188"
  type    = "A"
  proxied = false
  ttl     = 1
}

resource "cloudflare_record" "www_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "www"
  value   = "43.199.189.188"
  type    = "A"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "mainpage_autolife" {
  zone_id = cloudflare_zone.autolife.id
  name    = "autolife-robotics.me"
  value   = "43.199.189.188"
  type    = "A"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "mainpage_autolife_ai" {
  zone_id = "effd528990cab2cbfbce7bd9c1590a8d"
  name    = "autolife.ai"
  value   = "43.199.189.188"
  type    = "A"
  proxied = true
  ttl     = 1
}

resource "cloudflare_record" "www_mainpage_autolife_ai" {
  zone_id = "effd528990cab2cbfbce7bd9c1590a8d"
  name    = "www"
  value   = "43.199.189.188"
  type    = "A"
  proxied = true
  ttl     = 1
}
