#!/bin/bash

set -e -x

for i in `seq 1 10`;
do
  echo $(curl 'https://login.gorilla.wild.cf-app.com/oauth/token' -k -X POST -H 'Accept: application/json' -H 'Content-Type: application/x-www-form-urlencoded' -d 'client_id=performance_test&client_secret=secret&grant_type=password&username=testing@mailinator.org&password=secret&token_format=opaque&response_type=token') &
done

wait
echo "done"
