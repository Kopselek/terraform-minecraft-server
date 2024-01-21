resource "vultr_instance" "minecraft_instance" {
  label = "minecraft-instance"
  plan = "vc2-1c-2gb"
  region = ""
}
