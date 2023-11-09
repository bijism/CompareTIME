
#!/bin/bash

# Get the time from the local server
local_time=$(date +%T)

# Get the time from the remote server
remote_time=$(sshpass -p "mypassword" ssh username@ipserver date +%T)

# Add 03:30 to the remote server time
adjusted_remote_time=$(date -d"$remote_time 3 hours 30 minutes" +%T)

# Compare the times and print OK or NotOK
if [ "$local_time" = "$adjusted_remote_time" ]; then
    echo "OK"
else
    echo "NotOK"
fi
