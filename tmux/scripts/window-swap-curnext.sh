function swap_windows_currnext {
	currid=$(tmux display-message -p '#I')
	window_count=$(tmux display-message -p '#{session_windows}')
	nextid=$(((currid+1) % (window_count+1)))

	[[ "$currid" == 0 || "$nextid" == 0 ]] && return

	tmux swap-window -s :"$currid" -t :"$nextid"
	tmux select-window -t :"$nextid"

	# echo "SWAPPED '$currid' WITH '$nextid'" >> /tmp/tmuxtestlog.log
}

swap_windows_currnext
