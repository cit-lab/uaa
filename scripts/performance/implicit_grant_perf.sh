#!/bin/bash

set -e -x

password=<your password>

$(curl -k -v -b cookies.txt -c cookies.txt --cookie "X-Uaa-Csrf=test" --data "username=testing2@mailinator.org&password=$password&X-Uaa-Csrf=test" https://login.gorilla.wild.cf-app.com/login.do)
wait

for i in `seq 1 150`;
do
  echo $(curl -k -vs -b cookies.txt -c cookies.txt "https://login.gorilla.wild.cf-app.com/oauth/authorize?response_type=token&client_id=implicit_performance_test&scope=openid&redirect_uri=http://www.google.com" 2>&1) &
done

wait

echo "done"
