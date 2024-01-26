data "vultr_plan" "default" {
  filter {
    name   = "id"
    values = ["vc2-1c-2gb"]
  }
}

data "vultr_region" "warsaw" {
  filter {
    name   = "city"
    values = ["Warsaw"]
  }
}

data "vultr_os" "ubuntu_22" {
  filter {
    name   = "name"
    values = ["Ubuntu 22.04 LTS x64"]
  }
}
