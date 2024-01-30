variable "vultr_api_key" {
  type      = string
  sensitive = true
}

variable "cloudflare" {
  type    = bool
  default = false
}

variable "cloudflare_api_key" {
  type      = string
  sensitive = true
  default   = "0000000000000000000000000000000000000000"
}

variable "cloudflare_zone_id" {
  type    = string
  default = ""
}
