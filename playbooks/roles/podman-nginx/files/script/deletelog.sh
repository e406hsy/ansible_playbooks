#!/bin/sh

# Archive period
DAYS=30

SERVICE_DIR=$1
LOG_DIR=/home1/irteam/docker/nginx/logs/$SERVICE_DIR

echo "delete Log"
find $LOG_DIR -mtime +$DAYS -name "*.gz" -delete
