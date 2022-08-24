#!/bin/zsh

ICONsn="婢" # headphone unplugged, not muted
ICONsm="婢" # headphone unplugged, muted
ICONhn="" # headphone plugged in, not muted
ICONhm="ﱝ" # headphone plugged in, muted

if pamixer --get-default-sink > /dev/null
then
    if pamixer --get-mute > /dev/null
    then
        printf "$ICONhm $(pamixer --get-volume)%%"
    else
        printf "$ICONhn $(pamixer --get-volume)%%"
    fi
else
    if pamixer --get-mute > /dev/null
    then
        printf "$ICONsm $(pamixer --get-volume)%%"
    else
        printf "$ICONsn $(pamixer --get-volume)%%"
    fi
fi

