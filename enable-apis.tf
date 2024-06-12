resource "google_project_service" "api" {
  for_each = toset(var.apis)
  service  = each.value

  disable_on_destroy = false
}