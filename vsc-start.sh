#!/bin/bash

# Nombre de la sesión
SESSION_NAME="my_project"

# Directorios del frontend y backend
FRONTEND_DIR="$HOME/store/store-frontend"
BACKEND_DIR="$HOME/store/store-backend"

# Comprobar si ya existe la sesión
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    # Crear una nueva sesión y ventana para el frontend
    tmux new-session -d -s $SESSION_NAME -n frontend
    tmux send-keys -t $SESSION_NAME:0 "cd $FRONTEND_DIR && npm start" C-m

    # Crear una nueva ventana para el backend
    tmux new-window -t $SESSION_NAME -n backend
    tmux send-keys -t $SESSION_NAME:1 "cd $BACKEND_DIR && npm start" C-m
fi

# Adjuntar a la sesión
tmux attach-session -t $SESSION_NAME

