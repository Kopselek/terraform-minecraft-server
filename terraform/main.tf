resource "vultr_instance" "minecraft" {
  label             = "minecraft-instance"
  plan              = data.vultr_plan.default.id
  region            = data.vultr_region.warsaw.id
  os_id             = data.vultr_os.ubuntu_22.id
  firewall_group_id = vultr_firewall_group.minecraft.id
  ssh_key_ids       = [vultr_ssh_key.minecraft.id]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = tls_private_key.tls_key.private_key_pem
    host        = self.main_ip
  }

  provisioner "file" {
    source      = "${path.module}/../ansible/setup-mcserver.yml"
    destination = "/root/setup-mcserver.yml"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo DEBIAN_FRONTEND=noninteractive apt -y upgrade",
      "sudo apt-add-repository -y -u ppa:ansible/ansible",
      "sudo DEBIAN_FRONTEND=noninteractive apt -y install ansible",
      "sudo ansible-playbook /root/setup-mcserver.yml",
    ]
  }

  # user_data = join("\n", ["#cloud-config", yamlencode({
  #   package_update  = true
  #   package_upgrade = true
  #   packages = [
  #     "openjdk-17-jre-headless",
  #     "screen"
  #   ]
  #   runcmd = [
  #     "wget 'https://piston-data.mojang.com/v1/objects/8dd1a28015f51b1803213892b50b7b4fc76e594d/server.jar' -O minecraft_server.jar",
  #     "echo \"eula=true\" > eula.txt",
  #     "ufw disable",
  #     "screen -dmS minecraft java -Xms1024M -Xmx1024M -jar minecraft_server.jar nogui"
  #   ]
  # })])
}

resource "vultr_block_storage" "minecraft" {
  label                = "minecraft-storage"
  size_gb              = 40
  region               = data.vultr_region.warsaw.id
  attached_to_instance = vultr_instance.minecraft.id
  block_type           = "storage_opt"
}

resource "vultr_firewall_group" "minecraft" {
  description = "base group"
}

resource "vultr_firewall_rule" "minecraft" {
  firewall_group_id = vultr_firewall_group.minecraft.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "25565"
}

resource "vultr_firewall_rule" "ssh" {
  firewall_group_id = vultr_firewall_group.minecraft.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "22"
}

resource "cloudflare_record" "minecraft" {
  count   = var.cloudflare ? 1 : 0
  zone_id = var.cloudflare_zone_id
  name    = "@"
  type    = "A"
  ttl     = 60
  value   = vultr_instance.minecraft.main_ip
  proxied = false
}

resource "vultr_ssh_key" "minecraft" {
  name    = "vultr-ssh-key"
  ssh_key = tls_private_key.tls_key.public_key_openssh
}

resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
