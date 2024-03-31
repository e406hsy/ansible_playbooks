#!/bin/sh

SERVICE_DIR=$1
LOG_DIR=/home1/irteam/docker/nginx/logs/$SERVICE_DIR

# HTTPS
ACCESS_LOG=$LOG_DIR/access.log
ERROR_LOG=$LOG_DIR/error.log

#HTTP
HTTP_ACCESS_LOG=$LOG_DIR/http.access.log
HTTP_ERROR_LOG=$LOG_DIR/http.error.log

DATE=`date -d "-1 days" "+%Y%m%d"`

mv $ACCESS_LOG $ACCESS_LOG.$DATE
mv $ERROR_LOG $ERROR_LOG.$DATE
touch $ACCESS_LOG
touch $ERROR_LOG

mv $HTTP_ACCESS_LOG $HTTP_ACCESS_LOG.$DATE
mv $HTTP_ERROR_LOG $HTTP_ERROR_LOG.$DATE
touch $HTTP_ACCESS_LOG
touch $HTTP_ERROR_LOG

docker kill nginx --signal=USR1
