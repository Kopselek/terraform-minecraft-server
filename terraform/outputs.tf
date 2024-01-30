output "minecraft_ip" {
  value = vultr_instance.minecraft.main_ip
}

output "minecraft_hostname" {
  value = var.cloudflare ? local.cloudflare_minecraft_hostname : null
}
