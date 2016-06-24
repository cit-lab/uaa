#!/usr/bin/env bash

set -e -x

randomString=$(LANG=C < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c6)
displayName="testPostAdd1-$randomString"
echo $displayName
createBody="{\"displayName\":\"$displayName\"}"
header="X-Identity-Zone-Id:1e61e9c6-77fe-4adb-a43d-fcb86fb4b939"
uaac curl -XPOST /Groups -d $createBody -H $header -H "Content-type:application/json" -k
