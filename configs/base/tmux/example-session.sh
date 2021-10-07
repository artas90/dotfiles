has_some_session() {
  tmux has-session -t some_session 2>/dev/null || echo 1
}

if has_some_session; then
  tmux new-session -d -s some_session 'zsh'
  
  tmux split-window -v
  tmux send-keys "zsh" C-m

  tmux select-pane -t 1
  tmux split-window -h
  tmux send-keys "zsh" C-m
fi

tmux attach-session -t some_session
