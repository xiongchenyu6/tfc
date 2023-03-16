# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "digitalocean_droplet" "digital-1" {
  image      = "128792213" //nixos-image
  name       = "digital-1"
  region     = "sgp1"
  size       = "s-1vcpu-1gb"
  monitoring = false
  ssh_keys = [
    # data.digitalocean_ssh_key.office.id,
    data.digitalocean_ssh_key.ed.id
  ]
  # user_data = <<-EOF
  #       #cloud-config
  #       runcmd:
  #         - curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=nixos-22.05 bash -x
  #       EOF

  # connection {
  #   host        = self.ipv4_address
  #   user        = "root"
  #   type        = "ssh"
  #   # agent       = true
  #   private_key = file("./id_ed25519")
  #   timeout     = "2m"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "curl https://raw.githubusercontent.com/elitak/nixos-infect/master/nixos-infect | NIX_CHANNEL=nixos-22.11 bash -x"
  #   ]
  # }
}
