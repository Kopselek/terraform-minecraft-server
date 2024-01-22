data "vultr_region" "Warsaw" {
  filter {
    name   = "city"
    values = ["Warsaw"]
  }
}