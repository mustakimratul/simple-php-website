#!/bin/bash
CONTAINER_NAME_OR_ID=$1
IMAGE_NAME_OR_ID=$2

if [ -z "$CONTAINER_NAME_OR_ID" ]; then
  echo "Error: Container name or ID is required."
  echo "Usage: $0 <container_name_or_id> <image_name_or_id>"
  exit 1
fi

if [ -z "$IMAGE_NAME_OR_ID" ]; then
  echo "Error: Image name or ID is required."
  echo "Usage: $0 <container_name_or_id> <image_name_or_id>"
  exit 1
fi

echo "Stopping container $CONTAINER_NAME_OR_ID..."
docker stop $CONTAINER_NAME_OR_ID || { echo "Failed to stop container $CONTAINER_NAME_OR_ID"; exit 1; }
echo "Container $CONTAINER_NAME_OR_ID stopped successfully."

echo "Removing container $CONTAINER_NAME_OR_ID..."
docker rm $CONTAINER_NAME_OR_ID || { echo "Failed to remove container $CONTAINER_NAME_OR_ID"; exit 1; }
echo "Container $CONTAINER_NAME_OR_ID removed successfully."

echo "Removing image $IMAGE_NAME_OR_ID..."
docker rmi $IMAGE_NAME_OR_ID || { echo "Failed to remove image $IMAGE_NAME_OR_ID"; exit 1; }
echo "Image $IMAGE_NAME_OR_ID removed successfully."

echo "Cleanup completed!"