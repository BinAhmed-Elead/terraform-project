#!/bin/sh
sudo apt-get update -y
sudo apt-get install -y curl
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
docker volume create redis-data
docker run -v redis-data:/data -p 6379:6379 --name redis redis