# ----------------------------------------------------------------------------------
# Use Terraform with GCP (GKE)
# Made by Artem Burmak 
# 2023
# ----------------------------------------------------------------------------------
locals {
  cluster_name = "conduit"
}
# ---| VPC Network |----------------------------------------------------------------
resource "google_compute_network" "vpc" {
  name                    = "${local.cluster_name}-vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  count         = length(var.subnets_cidrs)
  name          = var.subnets_names[count.index]
  ip_cidr_range = var.subnets_cidrs[count.index]
  network       = google_compute_network.vpc.name
  region        = var.region
}

resource "google_compute_firewall" "firewall" {
  name    = "${local.cluster_name}-allow-traffic"
  network = google_compute_network.vpc.name

  allow {
    protocol = "tcp"
    ports    = var.allowed_ports
  }

  source_ranges = var.source_ranges
}
# ---| Kubernetes Engine |----------------------------------------------------------
resource "google_container_cluster" "this" {
  name               = "${local.cluster_name}-cluster"
  location           = var.region
  initial_node_count = var.initial_node_count

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size_gb
    disk_type    = var.disk_type
    oauth_scopes = var.oauth_scopes

    metadata = {
      disable-legacy-endpoints = "true"
    }

    tags = ["${local.cluster_name}-node"]
  }

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnets[0].name

  node_locations = var.subnets_regions
}
