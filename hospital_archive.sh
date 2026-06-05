#!/bin/bash

# Member 4 - The Archivist
# This script rotates the logs

archive_logs() {
    # Get current timestamp
    TIMESTAMP=$(date +"%Y%m%d_%H%M")
    # This function moves logs from active_logs to archived_logs
    # and renames them with a timestamp

    # Move heart rate log
    mv active_logs/heart_rate_log.log archived_logs/heart_rate_${TIMESTAMP}.log

    # Move temperature log
    mv active_logs/temperature_log.log archived_logs/temperature_${TIMESTAMP}.log

    # Move water usage log
    mv active_logs/water_usage_log.log archived_logs/water_usage_${TIMESTAMP}.log

    echo "Logs archived with timestamp: $TIMESTAMP"

    # Recreating empty log files so engine keeps running
    # after archiving is complete

    touch active_logs/heart_rate_log.log
    touch active_logs/temperature_log.log
    touch active_logs/water_usage_log.log

    echo "Empty log files recreated in active_logs"
}

# Call the function
archive_logs
