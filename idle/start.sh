#!/bin/sh
set -e

while true ; do
    if [ "$STRESS_ENABLED" = true ]; then
        timeout="${STRESS_TIMEOUT:-30s}"
        echo "Stressing for ${timeout}..."
        stress-ng --timeout "${timeout}" ${STRESS_ARGS}
    fi

    interval=${IDLE_INTERVAL:-5m}
    echo "Idling for ${interval}..."
    sleep "${interval}"
done
