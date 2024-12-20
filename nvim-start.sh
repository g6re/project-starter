#!/bin/bash

SESSION_NAME="my_project"

FRONTEND_DIR="$HOME/store/store-frontend"
BACKEND_DIR="$HOME/store/store-backend"

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION_NAME -n frontend
    tmux send-keys -t $SESSION_NAME:0 "cd $FRONTEND_DIR && npm start" C-m

    tmux new-window -t $SESSION_NAME -n backend
    tmux send-keys -t $SESSION_NAME:1 "cd $BACKEND_DIR && npm start" C-m

    tmux new-window -t $SESSION_NAME -n nvim-frontend
    tmux send-keys -t $SESSION_NAME:2 "cd $FRONTEND_DIR && nvim ." C-m

    tmux new-window -t $SESSION_NAME -n nvim-backend
    tmux send-keys -t $SESSION_NAME:3 "cd $BACKEND_DIR && nvim ." C-m
fi

tmux attach-session -t $SESSION_NAME

