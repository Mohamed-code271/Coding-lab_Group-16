
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
