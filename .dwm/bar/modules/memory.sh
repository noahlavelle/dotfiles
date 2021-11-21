#!/bin/zsh

printf " $(free -h | grep Mem | awk '{print $3}') ($(free | grep Mem | awk '{print substr($3/$2 * 100.0, 1, 3)}')%%)"

