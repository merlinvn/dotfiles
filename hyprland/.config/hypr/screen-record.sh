#!/bin/sh
fuser -sk -SIGINT "$0"
test "$1" = off && exit 0
[ "${FLOCKER}" != "$0" ] && exec env FLOCKER="$0" flock -enx "$0" "$0" "$@" || :
exec wf-recorder -f ~/screens/vids/vid-$(date +"%Y-%m-%d-%H%M%S").mp4 -g "$(slurp)"
