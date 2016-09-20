#! /bin/bash

while true; do
	export timestamp=`date +"%Y-%m-%dT%T.%3N"`
	export VALUES=$(/speedtest-linux-amd64-v1.0.2-c | tail -n 1  | awk -v timestamp="$timestamp" '{ printf "{ \"ping\": %s, \"download\": %s, \"upload\": %s, \"timestamp\": \"%s\" }", $3, $8, $13, timestamp }')
	echo $VALUES
	curl -XPOST http://192.168.10.1:9200/speed/speedtest -d "${VALUES}" 
	echo ""
	sleep 600
done
