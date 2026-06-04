#!/bin/bash

# Member 5 - Clinical Analyst
process_vitals() {
    echo "Processing critical vitals..."

    HEART_RATE_LOG="active_logs/heart_rate.log"
    TEMP_LOG="active_logs/temperature.log"
    OUTPUT="reports/critical_alerts.txt"

    mkdir -p reports
    > "$OUTPUT"

    echo "=== CRITICAL ALERTS REPORT ===" >> "$OUTPUT"
    echo "Generated on: $(date)" >> "$OUTPUT"
    echo "===============================" >> "$OUTPUT"

    echo "" >> "$OUTPUT"
    echo "--- Heart Rate Critical Events ---" >> "$OUTPUT"
    grep "CRITICAL" "$HEART_RATE_LOG" | awk -F',' '{print "Timestamp: " $1 " | Device_ID: " $2 " | Value: " $3}' >> "$OUTPUT"

    echo "" >> "$OUTPUT"
    echo "--- Temperature Critical Events ---" >> "$OUTPUT"
    grep "CRITICAL" "$TEMP_LOG" | awk -F',' '{print "Timestamp: " $1 " | Device_ID: " $2 " | Value: " $3}' >> "$OUTPUT"

    echo "Critical alerts saved to $OUTPUT"
}

process_vitals
