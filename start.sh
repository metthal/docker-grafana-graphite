#!/bin/bash

# Evaluate environmental variables in statsd config
# Do only only if the config haven't been evaluated yet
if [ ! -f /src/statsd/config.js ]; then
	cat /src/statsd/config.js.in | envsubst > /src/statsd/config.js
fi

/usr/bin/supervisord --nodaemon --configuration /etc/supervisor/conf.d/supervisord.conf
