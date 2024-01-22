resource "vultr_instance" "minecraft" {
  label  = "minecraft-instance"
  plan   = data.vultr_plan.default
  region = data.vultr_region.Warsaw
}

resource "vultr_block_storage" "minecraft" {
  size_gb = 10
  region  = data.vultr_block_storage.London
}
