#!/bin/sh
set -e

trap '{ echo "==> SIGTERM, exiting"; exit 0; }' TERM

while true ; do
    if [ -n "$STRESS_ENABLED" ]; then
        timeout="${STRESS_TIMEOUT:-30s}"
        echo "Stressing for ${timeout}..."
        stress-ng --timeout "${timeout}" ${STRESS_ARGS}
    fi

    interval=${IDLE_INTERVAL:-5m}
    echo "Idling for ${interval}..."
    sleep "${interval}"
done
