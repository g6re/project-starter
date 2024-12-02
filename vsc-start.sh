#!/bin/bash

SESSION_NAME="my_project"

FRONTEND_DIR="$HOME/store/store-frontend"
BACKEND_DIR="$HOME/store/store-backend"
PROJECT_DIR="$HOME/store"  # Directorio raíz del proyecto

tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSION_NAME -n frontend
    tmux send-keys -t $SESSION_NAME:0 "cd $FRONTEND_DIR && npm start" C-m

    tmux new-window -t $SESSION_NAME -n backend
    tmux send-keys -t $SESSION_NAME:1 "cd $BACKEND_DIR && npm start" C-m
fi

code "$PROJECT_DIR"

tmux attach-session -t $SESSION_NAME

