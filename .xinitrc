xrdb -merge "$HOME/.Xresources"

clipmenud &
sxhkd &
feh --bg-scale ~/wallpaper/gruvbox_dots.png &
picom &
dunst &

$HOME/builds/bar/status_bar &
$HOME/builds/bar/status_bar all &

exec dwm 2> ~/dwm.log

