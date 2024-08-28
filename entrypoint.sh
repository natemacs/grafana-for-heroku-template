#!/bin/bash

echo "env: ${DYNO}"
echo "port: ${PORT}"

envsubst "\$PORT" < /etc/grafana/grafana.ini.template > /etc/grafana/grafana.ini
/run.sh