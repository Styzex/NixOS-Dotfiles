#!/bin/bash

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n 1)
MUTE_STATE=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP 'yes|no')

if [ "$MUTE_STATE" = "yes" ]; then
    echo "Muted"
else
    echo "Volume: $VOLUME"
fi

