#!/bin/bash
# Member 5 - Clinical Analyst
# This script analyzes critical vitals from hospital logs

process_vitals() {
    mkdir -p reports
    > reports/critical_alerts.txt

    echo "Processing CRITICAL vitals..."

    grep "CRITICAL" active_logs/heart_rate* 2>/dev/null | awk '{print $1, $2, $3}' >> reports/critical_alerts.txt
    grep "CRITICAL" active_logs/temperature* 2>/dev/null | awk '{print $1, $2, $3}' >> reports/critical_alerts.txt

    echo "Done: reports/critical_alerts.txt created"
}

process_vitals

# Member 6 - The Facility Auditor
water_audit() {
    echo "Running water audit..."

    awk '/ICU_WATER_RESERVE/ {sum += $3; count++}
    END {
        if (count > 0)
            printf "ICU Water Reserve Average Usage: %.2f\n", sum/count
        else
            printf "No ICU_WATER_RESERVE data found\n"
    }' active_logs/water_usage*.log
}

water_audit

