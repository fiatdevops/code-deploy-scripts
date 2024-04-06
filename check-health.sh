#!/bin/bash
MAX_ATTEMPTS=3
CHECK_INTERVAL=15
BASE_URL="http://localhost:8000"  
HEALTH_CHECK_ENDPOINT="/v1/api/health-check/"
FAILED_ATTEMPTS=0

for ((i=1; i<=$MAX_ATTEMPTS; i++)); do

    response=$(curl -sSf -w "%{http_code}" "$BASE_URL$HEALTH_CHECK_ENDPOINT" -o /dev/null)

    if [ "$response" != "200" ]; then
        ((FAILED_ATTEMPTS++))
    else
        echo "Application is healthy."
        exit 0
    fi
    sleep $CHECK_INTERVAL
done

if [ $FAILED_ATTEMPTS -eq $MAX_ATTEMPTS ]; then
    echo "Application is not healthy after multiple attempts. Running revert script..."
    bash docker-revert.sh
    exit 1
fi
