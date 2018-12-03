#!/bin/bash
ps -ef  | grep "/usr/local/bin/node ./bin/www"
for id in $(ps -ef | grep "/usr/local/bin/node ./bin/www" | grep -v "grep" | awk '{print $2}'); do
    echo ${id} && \
    kill -9 ${id}
done || true
