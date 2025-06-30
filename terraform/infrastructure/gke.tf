resource "google_container_cluster" "default" {
  name = "my-website-gke-dev"
  project          = var.project

  location                 = var.region
  enable_autopilot         = true
  enable_l4_ilb_subsetting = true
}
