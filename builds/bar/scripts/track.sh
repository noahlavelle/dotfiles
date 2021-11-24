#!/bin/zsh
sleep 0.2
local track
track=$(timeout 0.5 playerctl metadata --format "{{artist}} - {{title}}") > /dev/null 2>&1
if timeout 0.5 playerctl metadata > /dev/null 2>&1
then
    track=$track

else
    track="No song playing"
fi

printf " $(print $track | awk -v len=100 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }')"

