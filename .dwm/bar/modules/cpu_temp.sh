#!/bin/zsh

ICONn="糖" # icon for normal temperatures
ICONc="" # icon for critical temperatures

crit=70 # critical temperature

temp="$(sensors -A | grep 'Tctl' | awk '{print $2}' | egrep -o '[0-9][0-9]')"

if [ $temp -lt $crit ] ; then
    printf "糖 $temp"
else
    printf "  $temp"
fi
