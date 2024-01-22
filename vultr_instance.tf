resource "vultr_instance" "minecraft" {
  label  = "minecraft-instance"
  plan   = vultr_plan.default
  region = vultr_region.Warsaw
}
