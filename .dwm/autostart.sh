feh --bg-scale ~/wallpaper/gruvbox_dots.png &
picom &
dunst &

# Load custom keyboard layout for 65% (pipe, backslash, backtick)
setxkbmap -layout gb &

# Load both scripts needed for the statusbar
update_bar_fields &
bar_values_monitor &
