#!/bin/bash

# Check if conky is running
# -x flag only match processes whose name (or command line if -f is
# specified) exactly match the pattern. 

if pgrep -x "conky" > /dev/null
then
    killall conky
else
    conky --config ~/.config/conky/conkyrc.lua &
fi
