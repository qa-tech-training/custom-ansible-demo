#!/bin/bash
sudo apt-get update
sudo apt-get install docker.io
sudo mkdir -p /var/lib/jenkins/.docker/cli-plugins
sudo curl -sL https://github.com/docker/compose/releases/download/v2.39.3/docker-compose-linux-x86_64 -o /var/lib/jenkins/.docker/cli-plugins/docker-compose
sudo chmod +x /var/lib/jenkins/.docker/cli-plugins/docker-compose
sudo chown -R jenkins:jenkins /var/lib/jenkins/.docker
