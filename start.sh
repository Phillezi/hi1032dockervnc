#!/bin/sh

# Check if the container exists
if [ "$(docker ps -a -q -f name=hi1032lab1vnc)" ]; then
  # If the container exists, check if it is running
  if [ "$(docker ps -q -f name=hi1032lab1vnc)" ]; then
    echo "Container hi1032lab1vnc is already running."
  else
    echo "Starting existing container hi1032lab1vnc..."
    docker start hi1032lab1vnc
  fi
else
  # If the container does not exist, run a new one from the image
  echo "Creating and starting a new container hi1032lab1vnc..."
  docker run -dt --name hi1032lab1vnc -p 5901:5901 -v ./shared:/shared hi1032lab1vnc
fi
