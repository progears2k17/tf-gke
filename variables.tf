variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
  default     = "*"
}

variable "apis" {
  description = "List of APIs to enable"
  type        = list(string)
  default     = [
    "compute.googleapis.com", 
    "container.googleapis.com", 
    "dns.googleapis.com", 
    "logging.googleapis.com", 
    "monitoring.googleapis.com", 
    "storage-api.googleapis.com" , 
    "storage-component.googleapis.com", 
    "serviceusage.googleapis.com", 
    "cloudresourcemanager.googleapis.com",
    "cloudbuild.googleapis.com",
    "artifactregistry.googleapis.com",
    "clouddeploy.googleapis.com"
    ]
}
