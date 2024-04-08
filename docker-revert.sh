#!/bin/bash
docker tag 406749516863.dkr.ecr.ap-south-1.amazonaws.com/fiatpe:latestv2 406749516863.dkr.ecr.ap-south-1.amazonaws.com/fiatpe:latest
docker-compose -f /root/docker-compose.yaml up -d --remove-orphans
