#!/bin/bash

# Member 5 (Clinical Analyst) - assisting with archive script

archive_logs() {
    TIMESTAMP=$(date +%Y%m%d_%H%M)

    echo "Archiving logs with timestamp: $TIMESTAMP"

    mv active_logs/heart_rate.log archived_logs/heart_rate_${TIMESTAMP}.log
    mv active_logs/temperature.log archived_logs/temperature_${TIMESTAMP}.log

    touch active_logs/heart_rate.log
    touch active_logs/temperature.log

    echo "Logs archived successfully."
}

archive_logs
