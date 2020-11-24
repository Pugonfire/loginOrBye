#!/bin/bash

# sleep for 10 minutes
sleep 10m

# check if users have logged in
# Replace <user> with username
# Can add users with '||'

if w | grep <user>; then
    echo "User logged in"
else
    sudo shutdown now
fi
