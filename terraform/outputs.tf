# ---| Outputs |---------------------------------------------------------
output "vpc_id" {
  description = "The ID of the VPC"
  value       = google_compute_network.vpc.id
}

output "subnets_ids" {
  description = "The IDs of the subnets"
  value       = google_compute_subnetwork.subnets.*.id
}
# ---| Outputs GKE |-----------------------------------------------------
output "gke_cluster_id" {
  description = "The ID of the GKE Cluster"
  value       = google_container_cluster.this.id
}

output "gke_cluster_location" {
  description = "The location (region or zone) of the GKE Cluster"
  value       = google_container_cluster.this.location
}

output "gke_cluster_endpoint" {
  description = "The endpoint (IP address) of the GKE Cluster master"
  value       = google_container_cluster.this.endpoint
}

output "gke_cluster_master_version" {
  description = "The version of the GKE Cluster master"
  value       = google_container_cluster.this.master_version
}
