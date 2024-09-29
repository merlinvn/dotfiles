#!/bin/bash

# Get the ID of the currently focused window and all window IDs in the current workspace
current_window_id=$(aerospace list-windows --focused --format %{window-id})
window_ids_string=$(aerospace list-windows --workspace focused --monitor focused --format %{window-id})

# Convert the string of window IDs into an array
IFS=$'\n' read -r -d '' -a window_ids <<<"$window_ids_string"

# Find the index of the current window in the list
current_index=0
for i in "${!window_ids[@]}"; do
  if [[ "${window_ids[$i]}" == "$current_window_id" ]]; then
    current_index=$i
    break
  fi
done

# Loop through the windows starting from the next one after the current
for ((i = 1; i <= ${#window_ids[@]}; i++)); do
  next_index=$(((current_index + i) % ${#window_ids[@]}))

  # Try to focus the window, and exit if successful
  if aerospace focus --window-id "${window_ids[$next_index]}"; then
    exit 0
  fi
done

# If no window could be focused, print an error message and exit
echo "Failed to focus any window"
exit 1
