#!/bin/bash

endpoint="http://console.minio-operator.svc.cluster.local"
echo GET $endpoint
http_status_code=$(curl -o /dev/null -s -w "%{http_code}\n" $endpoint)
echo "Expected http status code: 200"
echo "Actual http status code: $http_status_code"
if [[ "$http_status_code" == "200" ]]; then
  echo SUCCESS
else
  echo FAILURE
  exit 1
fi
