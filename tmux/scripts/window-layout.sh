function tmux_session {
  first_window=1

  if [[ $(tmux display-message -p '#I') == "$first_window" ]]; then
    tmux setw -g window-status-current-format  " #I:#W* "
  else
    tmux setw -g window-status-current-format  " #I:#W* "
  fi

  echo "function called" >> /tmp/tmux-session-window-layout.log
}

tmux_session
