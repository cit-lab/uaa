#!/usr/bin/env bash

for i in `seq 1 475`;
do
  printf $i
  curl -s -w %{time_total}\\n 'https://login.gorilla.wild.cf-app.com/oauth/token' -k -X POST -H 'Accept: application/json' -H 'Content-Type: application/x-www-form-urlencoded' -d 'client_id=performance_test&client_secret=secret&grant_type=client_credentials&token_format=opaque&response_type=token' &
done

wait

echo "We did it!"



