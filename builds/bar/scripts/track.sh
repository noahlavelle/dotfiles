#!/bin/zsh

sleep 0.2

local track
track=$(spotifycli --status) > /dev/null 2>&1

if [[ "$track" == "Spotify is off" ]]
then
    track="No song playing"
else
    track=$track
fi

printf " $(print $track | awk -v len=100 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }')"

