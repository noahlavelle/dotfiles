#!/bin/zsh

updates=$(/home/noah/.dwm/bar/modules/updates.sh)
$(sed -i "2s/.*/$updates/" /home/noah/.dwm/bar/bar_values)

