# ---| Variables |---------------------------------------------------------
variable "credentials_file" {
  type        = string
  description = "GCP credentials"
}

variable "project_id" {
  type        = string
  description = "The ID of the project where to contain the Cluster"
}

variable "region" {
  type        = string
  description = "GCP Region"
}

variable "network_name" {
  type        = string
  description = "The name of the network being created"
}

variable "subnets_cidrs" {
  type        = list(string)
  description = "The CIDR blocks for the subnets"
}

variable "subnets_regions" {
  type        = list(string)
  description = "The region where to create the subnets"
}

variable "subnets_names" {
  type        = list(string)
  description = "The names of the subnets"
}

variable "allowed_ports" {
  type        = list(string)
  description = "List of allowed ports for firewall"
  default     = ["22", "80", "443", "3000", "4100", "27017"]
}

variable "source_ranges" {
  type        = list(string)
  description = "List of source CIDR ranges for firewall"
  default     = ["0.0.0.0/0"]
}
# ---| Variables Kubernetes Engine |---------------------------------------
variable "initial_node_count" {
  type        = number
  description = "The number of nodes to create in the cluster initially"
  default     = 1
}

variable "machine_type" {
  type        = string
  description = "The name of a Google Compute Engine machine type"
  default     = "e2-medium"
}

variable "disk_size_gb" {
  type        = number
  description = "Size of the disk attached to each node"
  default     = 30
}

variable "disk_type" {
  type        = string
  description = "Type of the disk attached to each node"
  default     = "pd-standard"
}

variable "oauth_scopes" {
  type        = list(string)
  description = "The set of Google API scopes to be made available on all of the node VMs under the default service account"
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}
