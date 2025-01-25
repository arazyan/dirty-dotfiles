#!/bin/bash

# Get connected outputs
connected_output=$(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .name')

# Check for DP-1 or DP-2
if echo "$connected_output" | grep -q "^DP-1$"; then
  echo "set \$active_zeuslap_output DP-1" >~/.config/sway/scripts/output_var
elif echo "$connected_output" | grep -q "^DP-2$"; then
  echo "set \$active_zeuslap_output DP-2" >~/.config/sway/scripts/output_var
else
  echo "set \$active_zeuslap_output none" >~/.config/sway/scripts/output_var
fi
