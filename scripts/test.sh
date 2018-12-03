#!/bin/bash

until [ -s "/var/lib/jenkins/workspace/DevOps Backend/test.txt" ]
	do
		echo "hello"
		sleep 5
		echo "test"  > "/var/lib/jenkins/workspace/DevOps Backend/test.txt" 
	done
