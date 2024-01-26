resource "vultr_instance" "minecraft" {
  label     = "minecraft-instance"
  plan      = data.vultr_plan.default.id
  region    = data.vultr_region.Warsaw.id
  os_id     = data.vultr_os.ubuntu_22.id
  user_data = join("\n", "#cloud-config", yamlencode({
    package_update = true
    package_upgrade = true
    packages = [
      "openjdk-17-jre-headless",
      "screen"
    ]
    runcmd = [
      "wget 'https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar' -O minecraft_server.jar",
      "echo \"eula=true\" > eula.txt",
      "ufw disable",
      "screen -dmS minecraft java -Xms1024M -Xmx1024M -jar minecraft_server.jar nogui"
    ]
  }))
}

resource "vultr_block_storage" "minecraft" {
  label                = "minecraft-storage"
  size_gb              = 40
  region               = data.vultr_region.Warsaw.id
  attached_to_instance = vultr_instance.minecraft.id
  block_type           = "storage_opt"
}
