#!/bin/sh
set -e

trap '{ echo "==> SIGTERM, exiting"; exit 0; }' TERM

while true ; do
    if [ -n "$STRESS_ENABLED" ] && [ ! "$STRESS_ENABLED" = "0" ]; then
        timeout="${STRESS_TIMEOUT:-30s}"
        echo "stressing for ${timeout}..."
        stress-ng --timeout "${timeout}" ${STRESS_ARGS}
    fi

    interval=${IDLE_INTERVAL:-5m}
    echo "idling for ${interval}..."
    sleep "${interval}"
done
