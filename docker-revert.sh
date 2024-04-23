#!/bin/bash
docker tag 406749516863.dkr.ecr.ap-south-1.amazonaws.com/fiatpe-pre-prod:latestv2 406749516863.dkr.ecr.ap-south-1.amazonaws.com/fiatpe-pre-prod:latest
docker-compose -f /root/docker-compose.yaml up -d --remove-orphans
#cp -rf  /root/docker-compose.yaml-commn  /root/docker-compose.yaml
