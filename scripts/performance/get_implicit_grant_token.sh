#!/bin/bash
set -e -x

echo $(curl -k -vs -b cookies.txt -c cookies.txt "https://login.gorilla.wild.cf-app.com/oauth/authorize?response_type=token&client_id=implicit_performance_test&scope=openid&redirect_uri=http://www.google.com" 2>&1)

#echo "$access"
