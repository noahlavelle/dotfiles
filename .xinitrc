xrdb -merge "$HOME/.Xresources"

clipmenud &
sxhkd &
feh --bg-scale ~/wallpaper/gruvbox_dots.png &
picom &
dunst &

status_bar &
status_bar all &
pactl subscribe | grep --line-buffered "sink" | while read -r UNUSED_LINE; do status_bar volume; done &

exec dwm 2> ~/dwm.log

