terraform {
  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.19.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "vultr" {
  api_key = var.vultr_api_key
}

provider "cloudflare" {
  api_token = var.cloudflare_api_key
}
