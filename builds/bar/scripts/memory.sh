#!/bin/zsh

printf " $(free -h | grep Mem | awk '{print $3}') ($(free | grep Mem | awk '{print $3/$2 * 100.0}' | grep -o '^[0-9]*\.[0-9]')%%)"


