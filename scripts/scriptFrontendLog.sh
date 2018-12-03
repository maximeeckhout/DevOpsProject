#!/bin/bash

ps -ef | grep "ng serve --proxy-config proxy.conf.json --host 0.0.0.0 --disable-host-check" | grep -v "grep" > frontendConnected.txt
until [ -s frontendConnected.txt ]
	do
		#(cd "/var/lib/jenkins/workspace/DevOps Website/"; ng serve --proxy-config proxy.conf.json --host 0.0.0.0 --disable-host-check) &
		(cd "/var/lib/jenkins/workspace/DevOps Website/"; ng serve --proxy-config proxy.conf.json --host 0.0.0.0 --disable-host-check > "/var/lib/jenkins/workspace/DevOps Website/logWebsite.txt") &
		sleep 90
		ps -ef | grep "ng serve --proxy-config proxy.conf.json --host 0.0.0.0 --disable-host-check" | grep -v "grep" > frontendConnected.txt
	done
