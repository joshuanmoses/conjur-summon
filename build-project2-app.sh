#!/bin/bash

# BUILD: Basic Script to create a containerized application using DAP Secrets Injection (summon)

# Global Variables
containerName="project2-app"
containerIP="10.0.0.120"
containerImage="cau/project2-image"

# Set summon path
export PATH=$PATH:/usr/local/lib/summon

# Build Container Application (project2-app)
echo "Creating Docker Container: $containerName"
echo "------------------------------------"
set -x
docker run -e USER=$(summon-conjur pas_dev/app/db-mysql-cars/cardbapp/username) \
  -e PASS=$(summon-conjur pas_dev/app/db-mysql-cars/cardbapp/password) \
  --name $containerName \
  -d --restart=always \
  --network conjur-ipvlan \
  --ip $containerIP $containerImage 
set +x
