data "vultr_plan" "default" {
  filter {
    name   = "id"
    values = ["vcs2-1c-2gb"]
  }
}