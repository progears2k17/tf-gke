resource "google_cloudbuild_trigger" "trigger" {
  name = "sre-trigger-1"
  location = "europe-west1"
  github {
    owner = "*"
    name = "simplewebappk8s"
    push {
      branch = "master"
    }
  }
  service_account = google_service_account.cloudbuild_service_account.id
  filename        = "cloudbuild.yml"
  depends_on = [
    google_project_iam_member.act_as,
    google_project_iam_member.logs_writer
  ]
}

resource "google_service_account" "cloudbuild_service_account" {
  account_id = "cloud-sa"
}

resource "google_project_iam_member" "act_as" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
}

resource "google_project_iam_member" "logs_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
}

resource "google_project_iam_member" "admin" {
  project = var.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
}

############################################################################################################

