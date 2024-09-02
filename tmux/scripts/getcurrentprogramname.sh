#!/bin/bash

if [[ -z "$TMUX" ]]; then
	echo "not in tmux"
else
	session=$(tmux display-message -p '#S')
	windows=$(tmux list-windows | wc -l)
	window_name="#[fg=colour10]${session}: "

	if [[ $windows -gt 1 ]]; then
		window_name+="$(tmux display-message -p '#I:#W')"
	fi

	echo "$window_name"
fi
