#!/bin/bash

ps -ef | grep "usr/local/bin/node ./bin/www" | grep -v "grep" > backendConnected.txt
until [ -s backendConnected.txt ]
	do
		(cd "/var/lib/jenkins/workspace/DevOps Backend/"; npm start > "/var/lib/jenkins/workspace/DevOps Backend/logBackend.txt") &
		sleep 60
		ps -ef | grep "usr/local/bin/node ./bin/www" | grep -v "grep" > backendConnected.txt
	done
