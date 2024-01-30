locals {
  cloudflare_minecraft_hostname = one(cloudflare_record.minecraft[*].hostname)
}
