# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# The following variable is used to configure the provider's authentication
# token. You don't need to provide a token on the command line to apply changes,
# though: using the remote backend, Terraform will execute remotely in Terraform
# Cloud where your token is already securely stored in your workspace!

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "5.0.0-alpha1"

    }
  }
}


# Configure the DigitalOcean Provider
# provider "digitalocean" {
#   token = var.do_token
# }

# data "digitalocean_ssh_key" "freeman" {
#   name = "freeman"
# }

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
