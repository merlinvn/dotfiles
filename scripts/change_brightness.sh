#!/bin/bash

# get current brightness value
brightness=$(cat /sys/class/backlight/acpi_video0/brightness)

# get max brightness value
max_brightness=$(cat /sys/class/backlight/acpi_video0/max_brightness)
min_brightness=$(echo "scale=0; $max_brightness * 0.05" | bc)

# convert to int
min_brightness=${min_brightness%.*}

# get argument input would be 1 or -1
arg=$1

# calculate new brightness value +1 increase 5%, -1 decrease 5%
new_brightness=$(echo "scale=0; $brightness + $arg * $max_brightness * 0.05" | bc)
new_brightness=${new_brightness%.*}
# echo $new_brightness
# check if new brightness value is greater than max brightness
# if so set new brightness to max brightness
if [ $new_brightness -gt $max_brightness ]; then
    new_brightness=$max_brightness
fi

# check if new brightness value is less than 5% of max brightness
# if so set new brightness to 5% of max brightness
if [ $new_brightness -lt $min_brightness ]; then
    new_brightness=$min_brightness
fi

# set new brightness value
brightnessctl set $new_brightness
notify-send -t 500 Brightness $(cat /sys/class/backlight/acpi_video0/actual_brightness)
