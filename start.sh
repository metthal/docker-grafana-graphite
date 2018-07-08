#!/bin/bash

if [ ! -f /src/statsd/config.js ]; then
	cat /src/statsd/config.js.in | envsubst > /src/statsd/config.js
fi

/usr/bin/supervisord --nodaemon --configuration /etc/supervisor/conf.d/supervisord.conf
