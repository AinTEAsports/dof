function swap_windows_currprev {
	currid=$(tmux display-message -p '#I')
	window_count=$(tmux display-message -p '#{session_windows}')
	previd=$(((currid-1) % (window_count)))

	[[ "$currid" == 0 || "$previd" == 0 ]] && return

	tmux swap-window -s :"$currid" -t :"$previd"
	tmux select-window -t :"$previd"
}

swap_windows_currprev
