#!/bin/bash

code=$(curl 'https://login.gorilla.wild.cf-app.com/oauth/authorize?response_type=code&client_id=performance_test&redirect_uri=http%3A%2F%2Fwww.google.com&state=v4LpFF' -i -k -H 'Authorization: Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImxlZ2FjeS10b2tlbi1rZXkiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiI4NWRmNzY2OTRmZTg0NTZmYmU1Y2I5ZDU1ZDJiOWUxNCIsInN1YiI6IjhlMzg5NGNiLTk3NDUtNDA0OC04NTVlLThjZDMwZjcyMzA5ZSIsInNjb3BlIjpbInVhYS51c2VyIl0sImNsaWVudF9pZCI6InBlcmZvcm1hbmNlX3Rlc3QiLCJjaWQiOiJwZXJmb3JtYW5jZV90ZXN0IiwiYXpwIjoicGVyZm9ybWFuY2VfdGVzdCIsImdyYW50X3R5cGUiOiJwYXNzd29yZCIsInVzZXJfaWQiOiI4ZTM4OTRjYi05NzQ1LTQwNDgtODU1ZS04Y2QzMGY3MjMwOWUiLCJvcmlnaW4iOiJ1YWEiLCJ1c2VyX25hbWUiOiJ0ZXN0aW5nQG1haWxpbmF0b3Iub3JnIiwiZW1haWwiOiJ0ZXN0aW5nQG1haWxpbmF0b3Iub3JnIiwiYXV0aF90aW1lIjoxNDY1ODQwOTI2LCJyZXZfc2lnIjoiNWEyNDc5MDQiLCJpYXQiOjE0NjU4NDA5MjYsImV4cCI6MTQ2NTg4NDEyNiwiaXNzIjoiaHR0cHM6Ly91YWEuZ29yaWxsYS53aWxkLmNmLWFwcC5jb20vb2F1dGgvdG9rZW4iLCJ6aWQiOiJ1YWEiLCJhdWQiOlsicGVyZm9ybWFuY2VfdGVzdCIsInVhYSJdfQ.GJpkW56bUgGbkgEKHBsmamJNPghjsYKqoxuhEeihcQP34LrgSqHaCsO0IUoWwDkqbBC7wMW1YeqjTuqCIoXmO13ttWFgaIFum7fDLYK0mpKfTb_eAc4NIptCkTgCn8XR4Om4CXLOJyakzWe3dTsWJ7iLqAbBn2-eWBCUr0Eg4dYgCrfH34Pz7BJqKj9QBCGDlxd1SmR5ooac6PwvnlPsCLQjLPVreuDFj8Fh86xNsiwGJmfY5tpGZQ3DWtl7Mqs_PyYa41w8CUJIeWxWbOwxd-WIzsmwOmQXjtC_qGHjMIKyyF401H08iXJKdVjxDNX5bOtJNHwwMz-aT8d9P3eu_Q' | grep Location | sed 's/Location: http:\/\/www.google.com?code=//' | sed 's/&state=v4LpFF//' |tr '\r' ' ' | sed -e 's/ //')

#echo "*************************************$code"

#codes=`echo "$code"|tr '\r' ' ' | sed -e 's/ //'`
echo "*************************************$code"

response=$(curl 'https://login.gorilla.wild.cf-app.com/oauth/token' -k -X POST -H 'Accept: application/json' -H 'Content-Type: application/x-www-form-urlencoded' -d "client_id=performance_test&client_secret=secret&grant_type=authorization_code&response_type=token&code=$code&redirect_uri=http%3A%2F%2Fwww.google.com")
echo "$response"

