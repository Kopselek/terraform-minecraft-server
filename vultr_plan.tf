data "vultr_plan" "default" {
  filter {
    name   = "id"
    values = ["vc2-1c-2gb"]
  }
}
