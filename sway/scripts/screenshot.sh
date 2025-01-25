#!/usr/bin/env bash
DUNST=$(pidof dunst)
FILENAME="$HOME/Pictures/Screenshots/$(date +'%Y.%m.%d-%H:%m:%S').png"

touch $FILENAME
grim $FILENAME

wl-copy <$FILENAME
# for preview
# feh $FILENAME
if [ $DUNST ]; then
  notify-send "Screenshot" "File saved as $FILENAME\nand copied to clipboard" -t 6000 -i $FILENAME
fi
