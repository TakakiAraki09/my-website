
resource "google_compute_network" "default" {
  name    = "my-website-network"
  project = var.project

  auto_create_subnetworks  = false
  enable_ula_internal_ipv6 = true
}

resource "google_compute_subnetwork" "default" {
  name = "my-website-subnetwork"
  project          = var.project

  region        = var.region

  ip_cidr_range = "10.0.0.0/16"
  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "EXTERNAL"

  network = google_compute_network.default.id

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "192.168.0.0/24"
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = "192.168.1.0/24"
  }
}

resource "google_compute_address" "iperf3_ip" {
  name         = "iperf3-ip"
  project      = var.project
  region       = var.region
  address_type = "EXTERNAL"
  network_tier = "STANDARD"  # または "STANDARD" (安い方)
}

output "iperf3_external_ip" {
  value = google_compute_address.iperf3_ip.address
}
