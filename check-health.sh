#!/bin/bash
MAX_ATTEMPTS=3
WAIT_TIME=10
FAILED_ATTEMPTS=0

BASE_URL="http://localhost:8000"
HEALTH_CHECK_ENDPOINT="/v1/api/health-check/"

while true; do
 
    response=$(curl -sSf -w "%{http_code}" "$BASE_URL$HEALTH_CHECK_ENDPOINT" -o /dev/null)
    
    if [ "$response" != "200" ]; then
        ((FAILED_ATTEMPTS++))

        if [ $FAILED_ATTEMPTS -ge $MAX_ATTEMPTS ]; then
            echo "Application is not healthy after multiple attempts. Reverting deployment..."
            # ./revert-deployment.sh
            exit 1
        fi
    else
        echo "Application is healthy."
        exit 0
    fi

    sleep $WAIT_TIME
done
