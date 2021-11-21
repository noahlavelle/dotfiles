#!/bin/zsh

while inotifywait -qre modify /home/noah/.dwm/bar > /dev/null
do
    $(update_bar)
done
