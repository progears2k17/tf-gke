provider "google" {
  credentials = file("./sa.json")
  project = "*"
}