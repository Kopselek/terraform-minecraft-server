terraform {
    required_providers {
      source = "vultr/vultr"
      version = "2.19.0"
    }
}

provider "vultr" {
    api_key = var.VULTR_API_KEY
}

variable "VULTR_API_KEY" {}