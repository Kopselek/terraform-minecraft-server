data "vultr_region" "Warsaw" {
  filter {
    name   = "city"
    values = ["Warsaw"]
  }
}

data "vultr_block_storage" "London" {
  filter {
    name   = "city"
    values = ["London"]
  }
}
