#!/usr/bin/env bash

session_name=$(tmux display-message -p '#S')
session_name_length=${#session_name}
tmux set-option -g status-left-length $((session_name_length + 5))