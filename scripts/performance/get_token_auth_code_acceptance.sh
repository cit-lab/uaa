#!/bin/bash

code=$(curl 'https://login.identity.cf-app.com/oauth/authorize?response_type=code&client_id=performance_test&redirect_uri=http%3A%2F%2Fwww.google.com&state=v4LpFF' -i -k -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImxlZ2FjeSIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJhNzBlYjE5OGJmODU0ODg5YjA2Yjk3NWZiYzgxMjYyMyIsInN1YiI6IjVlODNlMDhlLWM4YTItNDIwYy1iY2RkLThhYTUzMTQ2YTg5ZiIsInNjb3BlIjpbIm9wZW5pZCIsInVhYS51c2VyIiwib2F1dGguYXBwcm92YWxzIl0sImNsaWVudF9pZCI6InBlcmZvcm1hbmNlX3Rlc3QiLCJjaWQiOiJwZXJmb3JtYW5jZV90ZXN0IiwiYXpwIjoicGVyZm9ybWFuY2VfdGVzdCIsImdyYW50X3R5cGUiOiJwYXNzd29yZCIsInVzZXJfaWQiOiI1ZTgzZTA4ZS1jOGEyLTQyMGMtYmNkZC04YWE1MzE0NmE4OWYiLCJvcmlnaW4iOiJ1YWEiLCJ1c2VyX25hbWUiOiJ0ZXN0QHRlc3Qub3JnIiwiZW1haWwiOiJ0ZXN0QHRlc3Qub3JnIiwiYXV0aF90aW1lIjoxNDY1NTkwOTk0LCJyZXZfc2lnIjoiYWM2Y2QwZjYiLCJpYXQiOjE0NjU1OTA5OTQsImV4cCI6MTQ2NTYzNDE5NCwiaXNzIjoiaHR0cHM6Ly91YWEuaWRlbnRpdHkuY2YtYXBwLmNvbS9vYXV0aC90b2tlbiIsInppZCI6InVhYSIsImF1ZCI6WyJwZXJmb3JtYW5jZV90ZXN0Iiwib3BlbmlkIiwidWFhIiwib2F1dGgiXX0.DKxNBfgyQQZ3S_J-qAvGQbdvqBLm_yO-6t7wzI6_PL-Mcn_Q2u_vLPs8NU9BckLOKskK5wyDz4fxXGf8KiaxY7TlrP9kPvY8Gpkind75rNhzxBSS9zyO2Ep7TU5YiET3AfKPGJhGR-tRYgkieB6y_-ucp6HnBct9ED-rHDW3G30' | grep Location | sed 's/Location: http:\/\/www.google.com?code=//' | sed 's/&state=v4LpFF//' | sed 's/\r//')
#echo $code
#codes=`echo "$code"|tr '\r' ' '`

response=$(curl 'https://login.identity.cf-app.com/oauth/token' -k -X POST -H 'Accept: application/json' -H 'Content-Type: application/x-www-form-urlencoded' -d "client_id=performance_test&client_secret=secret&grant_type=authorization_code&response_type=token&code=$codes&redirect_uri=http%3A%2F%2Fwww.google.com")

echo "$response"
