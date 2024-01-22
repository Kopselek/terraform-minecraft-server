data "vultr_region" "Warsaw" {
  filter {
    name   = "city"
    values = ["Warsaw"]
  }
}

data "vultr_region" "London" {
  filter {
    name   = "city"
    values = ["London"]
  }
}
