#!/bin/bash

set -e -x

for i in `seq 1 80`;
do
  ./get_token_auth_code.sh &
done

wait
echo "done"
