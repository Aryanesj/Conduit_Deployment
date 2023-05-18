# Conduit Deployment
***
## Overview

1. **Dockerized Full-Stack App**
   - Find a full-fledged application with frontend, backend, and a database. Containerization of the application using Docker (Dockerfile for each service). Uploading the ready-made images to Docker Hub.
   - **Details:**
    > ###### **Frontend:** docker run --network "your-network" -p 4100:4100 --name "your-custom-name" -d(optional) dockerhub-name/container-name
    > ###### **Database:** docker run --network "your-network" -p 27017:27017 --name "your-custom-name" -d(optional) dockerhub-name/container-name 
    > ###### **Backend:** docker run --network "your-network" -p 3000:3000 --name "your-custom-name" -e NODE_ENV=production -e MONGODB_URI=mongodb://"mongo-сustom-container-name":27017/conduit -e SECRET=your-secret-key -d(optional) dockerhub-name/container-name

2. **Setting Up VPC and Creating a Cluster for Application Deployment in Kubernetes (GKE) on Google Cloud Platform (GCP).**
   - **Set up a Virtual Private Cloud (VPC):** A Google Compute Network (VPC) is being created with the name "conduit-vpc". Auto-creation of subnetworks is disabled.

   - **Create Subnetworks:**  A number of subnetworks are created within the VPC. The number, names, and CIDR ranges of these subnetworks are supplied through Terraform variables.

   - **Configure Firewall Rules:** A Google Compute Firewall is set up to allow certain types of network traffic into the VPC. It is configured to allow TCP traffic on certain ports, and the range of source IPs that can send traffic is defined via Terraform variables.

   - **Create Kubernetes Cluster:** A Google Kubernetes Engine (GKE) cluster named "conduit-cluster" is created. This cluster is placed in the VPC and the first subnet that was created. The cluster has a specified number of initial nodes, and the master node's authentication configuration is set to not issue client certificates. Nodes within the cluster are assigned certain OAuth scopes, and their disk size, type, and machine type are set via Terraform variables.

3. **Soon**