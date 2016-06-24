#!/usr/bin/env bash
limit=300
upto=$(($limit+10))
seq 10 $upto | parallel -P $limit ./get_token.sh

