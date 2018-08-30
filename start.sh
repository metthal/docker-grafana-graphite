#!/bin/bash

# Evaluate environmental variables in statsd config
# Do only only if the config haven't been evaluated yet
if [ ! -f /src/statsd/config.js ]; then
	cat /src/statsd/config.js.in | envsubst > /src/statsd/config.js
fi

# Install plugins.
echo "${GRAFANA_PLUGINS}" | tr ':' '\n' | xargs -I{} /opt/grafana/bin/grafana-cli --pluginsDir /opt/grafana/data/plugins plugins install {}

# Run grafana.
/usr/bin/supervisord --nodaemon --configuration /etc/supervisor/conf.d/supervisord.conf
