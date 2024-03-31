#!/bin/sh

# File date format
DATE=`/bin/date +%y%m%d`

# Archive period
DAYS=30
COMPRESS_DAYS=5

SERVICE_DIR=$1
LOG_DIR=/home1/irteam/docker/nginx/logs/$SERVICE_DIR

function compress_log {
        echo "compress_log"
        find $LOG_DIR -mtime +$COMPRESS_DAYS -name "access.log.*" ! -name "*.gz" -exec /bin/nice gzip -v {} \;
        find $LOG_DIR -mtime +$COMPRESS_DAYS -name "error.log.*" ! -name "*.gz" -exec /bin/nice gzip -v {} \;
}

function compress_http_log {
        echo "compress_http_log"
        find $LOG_DIR -mtime +$COMPRESS_DAYS -name "http.access.log.*" ! -name "*.gz" -exec /bin/nice gzip -v {} \;
        find $LOG_DIR -mtime +$COMPRESS_DAYS -name "http.error.log.*" ! -name "*.gz" -exec /bin/nice gzip -v {} \;
}

### Main ###
compress_log
compress_http_log
