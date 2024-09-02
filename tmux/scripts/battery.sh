#!/usr/bin/env bash

BATTERY_PERCENTAGE="$(~/.config/tmux/scripts/battery | cut -d '%' -f 1)"

get_battery_icon() {
	if [[ $BATTERY_PERCENTAGE -lt 10 ]]; then echo "󰁺"
	elif [[ $BATTERY_PERCENTAGE -lt 20 ]]; then echo "󰁻"
	elif [[ $BATTERY_PERCENTAGE -lt 30 ]]; then echo "󰁼"
	elif [[ $BATTERY_PERCENTAGE -lt 40 ]]; then echo "󰁽"
	elif [[ $BATTERY_PERCENTAGE -lt 50 ]]; then echo "󰁾"
	elif [[ $BATTERY_PERCENTAGE -lt 60 ]]; then echo "󰁿"
	elif [[ $BATTERY_PERCENTAGE -lt 70 ]]; then echo "󰂀"
	elif [[ $BATTERY_PERCENTAGE -lt 80 ]]; then echo "󰂁"
	elif [[ $BATTERY_PERCENTAGE -lt 90 ]]; then echo "󰂂"
	else echo "󰁹"
	fi
}


# Means it is charging
if [[ -n "$(~/.config/tmux/scripts/battery Charging)" ]]; then echo -n " "; fi

echo "$(get_battery_icon) ${BATTERY_PERCENTAGE}%"
