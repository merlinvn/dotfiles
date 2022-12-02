#!/usr/bin/env bash


# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do : ; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}') MONITOR=$m polybar --reload bar &
  done
else
  polybar --reload bar &
fi

# # Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log
# polybar bar 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
