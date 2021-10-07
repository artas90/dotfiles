no_some_session() {
  tmux has-session -t some_session 2>/dev/null || echo 1
}

if no_some_session; then
  tmux new-session -d -s some_session 'zsh'
  tmux send-keys " clear" C-m
  
  tmux split-window -v
  tmux send-keys " zsh" C-m
  tmux send-keys " clear" C-m

  tmux select-pane -t 1
  tmux split-window -h
  tmux send-keys " zsh" C-m
  tmux send-keys " clear" C-m
fi

tmux attach-session -d -t some_session
