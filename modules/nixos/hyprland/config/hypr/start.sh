#!/usr/bin/env bash

swww init &
swww img /home/user/.bg &

# pkgs.networkmanagerapplet
nm-applet --indicator &

waybar &
