#!/bin/bash

# Login to Docker registry (if needed)
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 406749516863.dkr.ecr.ap-south-1.amazonaws.com

# Pull the Docker images
docker pull 406749516863.dkr.ecr.ap-south-1.amazonaws.com/java:latest

# Start your containers using docker-compose
docker-compose -f /root/docker-compose.yaml up -d
