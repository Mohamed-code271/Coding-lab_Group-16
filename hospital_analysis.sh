
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
