#!/usr/bin/env bash

get_icon() {
	name="$1"

	case "$name" in
		nvim) echo " " ;;
		glances|*top) echo " " ;;
		# *sh) echo " " ;;
		zsh|bash|sh) echo " " ;;
		ollama) echo " " ;;
		fzf) echo "󰭎 " ;;
		cmus|musikcube|moc|mocp) echo " " ;;
		lf|ranger) echo " " ;;
		ping) echo "󱄙 " ;;
		nim|nimble) echo " " ;;
		*) echo "" ;;
	esac
}

window_number=$(tmux display-message -p "#I")
window_name=$(tmux display-message -p "#W")
icon=$(get_icon "$window_name")

if [[ -z "$icon" ]]; then echo "$window_number:$window_name"
else echo "$icon $window_number:$window_name"
fi

# tmux display-message -p "#I: #{pane_current_command} + YES"
