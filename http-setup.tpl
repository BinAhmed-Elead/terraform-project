#!/bin/sh
sudo apt-get update -y
sudo apt-get install -y curl
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
docker push abdullahbinahmed/flask-app
docker run -p 80:5000 -e "REDIS_HOST=${redis_host}" -e "DB_HOST=${db_host}" --name web abdullahbinahmed/flask-app
