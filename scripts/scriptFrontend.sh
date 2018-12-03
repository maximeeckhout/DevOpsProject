#!/bin/bash
ps -ef  | grep "ng serve"
for id in $(ps -ef | grep "ng serve" | grep -v "grep" | awk '{print $2}'); do
    echo ${id} && \
    kill -9 ${id}
done || true
