resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "europe-west1"

  remove_default_node_pool = true
  initial_node_count       = 1
  network = google_compute_network.vpc_network.name
  subnetwork = google_compute_subnetwork.vpc_subnetwork.name
  deletion_protection = false

}


resource "google_container_node_pool" "primary" {
  name          = "my-node-pool"
  location      = "europe-west1"
  cluster       = google_container_cluster.primary.name
  node_count    = 1
  node_locations = ["europe-west1-b"]

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/cloud-platform"

    ]
  }
}