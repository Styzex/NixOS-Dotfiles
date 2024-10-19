#!/bin/sh

# Directory containing wallpapers
WALLPAPER_DIR="~/Wallpapers"

# Choose a random file from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n1)

# Set the wallpaper
swww img "$WALLPAPER" --transition-type center --transition-duration 3
