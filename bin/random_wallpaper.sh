#!/bin/sh

while true; do
	PIDS=$(pidof swaybg)
	swaymsg -t get_outputs -r | jq -r '.[] .name' | while read -r out; do
		swaybg -o "$out" -i "$(find ~/Pictures/Wallpapers/. -type f | shuf -n1)" -m fill &
	done
	sleep 1
	for pid in $PIDS; do kill "$pid"; done
	sleep 900
done
