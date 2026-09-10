#!/bin/bash

sudo apt update
sudo apt install -y docker-ce docker-ce-cli docker-compose-plugin
sudo systemctl start docker
sudo systemctl status docker
