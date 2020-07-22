#!/bin/sh
set -e

trap '{ echo "==> SIGTERM, exiting"; date >> /data/cookie; exit 0; }' TERM

if [ -f /data/cookie ]; then
    echo "==> previous shutdown"
    cat /data/cookie
    echo "==> eof"
fi

while true ; do
    if [ -n "$STRESS_ENABLED" ] && [ ! "$STRESS_ENABLED" = "0" ]; then
        timeout="${STRESS_TIMEOUT:-30s}"
        echo "Stressing for ${timeout}..."
        stress-ng --timeout "${timeout}" ${STRESS_ARGS}
    fi

    interval=${IDLE_INTERVAL:-5m}
    echo "Idling for ${interval}..."
    sleep "${interval}"
done
