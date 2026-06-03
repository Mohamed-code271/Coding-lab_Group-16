#!/bin/bash
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

    echo "System directories are ready!" - $(date)
}

initialize_system


# securing code (-2-)

#!/bin/bash

File="active_logs"

PERM=$(stat -c "%a" "$File")

ls -l "$File"

if [ "$PERM" -eq 700 ]
then
    echo "$File is protected"
else
    chmod 700 "$File"
    echo "$File is under protection"
fi

ls -l "$File"
