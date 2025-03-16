#!/bin/bash

# Set your Docker Hub username
DOCKER_USERNAME="your-dockerhub-username"
# Set the image name
IMAGE_NAME="chatwoot"
# Set the image tag
IMAGE_TAG="latest"

# Full image name
FULL_IMAGE_NAME="$DOCKER_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

echo "Building Docker image using existing Dockerfile: $FULL_IMAGE_NAME"
# Use the existing Dockerfile in the docker directory
docker build -t $FULL_IMAGE_NAME -f docker/Dockerfile .

echo "Logging in to Docker Hub"
docker login

echo "Pushing image to Docker Hub"
docker push $FULL_IMAGE_NAME

echo "Done! Your image is now available at: $FULL_IMAGE_NAME"
echo ""
echo "You can now use this image in your Railway deployment with:"
echo "FROM $FULL_IMAGE_NAME"
