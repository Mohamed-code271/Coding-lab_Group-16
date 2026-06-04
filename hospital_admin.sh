m#!/bin/bash
# Member 1 - The Architect
# This function initializes the hospital system directories
initialize_system() {
    if [ ! -d "active_logs" ]; then
        echo "Creating active_logs directory..."
        mkdir active_logs
    fi

    if [ ! -d "archived_logs" ]; then
        echo "Creating archived_logs directory..."
        mkdir archived_logs
    fi

    if [ ! -d "reports" ]; then
        echo "Creating reports directory..."
        mkdir reports
    fi

    echo "System directories are ready! - $(date)"
}

# Member 2 - The Security Lead

#This function secures the active_logs directory

#Only the owner will have read and write permissions

secure_data() {
          chmod 600 active_logs
           ls -l active_logs
           echo “permissions secured  for active_logs”
}

# Member 3 - The Orchestrator
# Calling all functions in order
initialize_system
secure_data
echo "System Environment Secured - $(date)"

