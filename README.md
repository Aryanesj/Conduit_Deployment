# Conduit Deployment
***
## Overview

1. **GCP Storage Bucket**
   - *Find a full-fledged application with frontend, backend, and a database. Containerization of the application using Docker (Dockerfile for each service). Uploading the ready-made images to Docker Hub.*

    > ###### **Frontend:** docker run --network "your-network" -p 4100:4100 --name "your-custom-name" -d(optional) dockerhub-name/container-name
    > ###### **Database:** docker run --network "your-network" -p 27017:27017 --name "your-custom-name" -d(optional) dockerhub-name/container-name 
    > ###### **Backend:** docker run --network "your-network" -p 3000:3000 --name "your-custom-name" -e NODE_ENV=production -e MONGODB_URI=mongodb://"mongo-сustom-container-name":27017/conduit -e SECRET=your-secret-key -d(optional) dockerhub-name/container-name
