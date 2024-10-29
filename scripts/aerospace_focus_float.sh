#!/bin/bash

# Get the currently focused window ID as a single number
current_window_id=$(aerospace list-windows --focused --format %{window-id} 2>/dev/null | head -n 1 | tr -d '[:space:]')
# Retrieve the list of window IDs in the current workspace and monitor as a space-separated string
window_ids=$(aerospace list-windows --workspace focused --monitor focused --format "%{window-id}" 2>/dev/null | tr '\n' ' ')

# Initialize variables
next_window_id=""
found_current=0

# Iterate through space-separated window IDs
for window_id in $window_ids; do

  # Find the next window ID
  if [[ $found_current -eq 1 ]]; then
    next_window_id=$window_id
    break
  fi
  if [[ "$window_id" == "$current_window_id" ]]; then
    found_current=1
  fi
done

# If we didn’t find the next window, set it to the first window in the list
if [[ -z $next_window_id ]]; then
  next_window_id=$(echo "$window_ids" | awk '{print $1}')
fi

# Focus on the next window if found
if [[ -n $next_window_id ]]; then
  aerospace focus --window-id "$next_window_id"
else
  echo "Error: Next window ID not found."
fi

# # Get the ID of the currently focused window and all window IDs in the current workspace
# current_window_id=$(aerospace list-windows --focused --format %{window-id})
# window_ids_string=$(aerospace list-windows --workspace focused --monitor focused --format %{window-id})
#
# # Convert the string of window IDs into an array
# IFS=$'\n' read -r -d '' -a window_ids <<<"$window_ids_string"
#
# # Find the index of the current window in the list
# current_index=0
# for i in "${!window_ids[@]}"; do
#   if [[ "${window_ids[$i]}" == "$current_window_id" ]]; then
#     current_index=$i
#     break
#   fi
# done
#
# # Loop through the windows starting from the next one after the current
# for ((i = 1; i <= ${#window_ids[@]}; i++)); do
#   next_index=$(((current_index + i) % ${#window_ids[@]}))
#
#   # Try to focus the window, and exit if successful
#   if aerospace focus --window-id "${window_ids[$next_index]}"; then
#     exit 0
#   fi
# done
#
# # If no window could be focused, print an error message and exit
# echo "Failed to focus any window"
# exit 1
