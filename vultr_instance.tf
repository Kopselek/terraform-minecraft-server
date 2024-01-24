resource "vultr_instance" "minecraft" {
  label     = "minecraft-instance"
  plan      = data.vultr_plan.default.id
  region    = data.vultr_region.London.id
  os_id     = data.vultr_os.ubuntu_22.id
  user_data = file("cloud-config.yml")
}

resource "vultr_block_storage" "minecraft" {
  label                = "minecraft-storage"
  size_gb              = 10
  region               = data.vultr_region.London.id
  attached_to_instance = vultr_instance.minecraft.id
}
