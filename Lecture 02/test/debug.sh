#!/usr/bin/env bash


runs=0

until [[ "$?" -ne 0 ]]; do
    runs=$((runs + 1))
    sh error.sh &> /dev/null
done

echo "found error after $runs runs"
