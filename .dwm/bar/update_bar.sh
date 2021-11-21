#!/bin/zsh

. ~/.dwm/bar/themes/gruvbox

bar_values=$HOME/.dwm/bar/bar_values

track=$(sed -n '1,1p' $bar_values)
volume=$(sed -n '2,1p' $bar_values)
memory=$(sed -n '3,1p' $bar_values)
temp=$(sed -n '4,1p' $bar_values)
updates=$(sed -n '5,1p' $bar_values)
calendar=$(sed -n '6,1p' $bar_values)

xsetroot -name "^c$yellow^$track^d^ | ^c$green^$volume^d^ | ^c$red^$memory^d^ | ^c$orange^$temp^d^ | ^c$pink^$updates^d^ | ^c$blue^$calendar^d^    "
