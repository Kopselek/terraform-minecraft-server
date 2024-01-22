data "vultr_os" "ubuntu_22" {
  filter {
    name   = "name"
    values = ["Ubuntu 22.04 LTS x64"]
  }
}
