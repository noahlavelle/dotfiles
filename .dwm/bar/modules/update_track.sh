#!/bin/zsh

track=$(~/.dwm/bar/modules/track.sh)
$(sed -i "1s/.*/$track/" ~/.dwm/bar/bar_values)

