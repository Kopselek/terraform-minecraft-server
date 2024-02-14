output "minecraft_ip" {
  description = "Public IP of server"
  value       = vultr_instance.minecraft.main_ip
}

output "minecraft_hostname" {
  description = "Public hostname of server"
  value       = var.cloudflare ? local.cloudflare_minecraft_hostname : null
}
