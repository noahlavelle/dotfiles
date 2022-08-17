xrdb -merge "$HOME/.Xresources"
setxkbmap gb

clipmenud &
sxhkd &
feh --bg-fill ~/wallpaper/nord_mountains.jpg &
picom &
dunst &

# Lock Screen
xss-lock ~/.config/lock.sh &
xset s 600

status_bar &
status_bar all &
pactl subscribe | grep --line-buffered "sink" | while read -r UNUSED_LINE; do status_bar volume; done &

exec dwm 2> ~/builds/dwm/.dwm.log

