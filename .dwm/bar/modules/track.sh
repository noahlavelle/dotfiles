#!/bin/zsh
local track
track=$(playerctl metadata --format "{{artist}} - {{title}}") > /dev/null 2>&1
if playerctl metadata > /dev/null 2>&1
then
    track=$track

else
    track="No song playing"
fi

printf " $(print $track | awk -v len=100 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }')"

