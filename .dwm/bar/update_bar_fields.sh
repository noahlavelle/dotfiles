#!/bin/zsh

# Bar Fields:
# 1 = Track
# 2 = Volume
# 3 = Memory
# 4 = Temperature
# 5 = Updates
# 6 = Clock

interval=0
bar_modules=$HOME/.dwm/bar/modules

function update_var {
    sed -i "$(print $1)s/.*/$2/" $HOME/.dwm/bar/bar_values
}

while true
do
    volume=$($bar_modules/volume.sh)
    memory=$($bar_modules/memory.sh)
    temperature=$($bar_modules/cpu_temp.sh)
    clock=$($bar_modules/calendar.sh)

    update_var 2 $volume
    update_var 3 $memory
    update_var 4 $temperature
    update_var 6 $clock

    if [[ $interval = 0 || $(($interval % 300)) = 0 ]]
    then
        updates=$($bar_modules/updates.sh)
        update_var 5 $updates
    fi

    sleep 1
done
