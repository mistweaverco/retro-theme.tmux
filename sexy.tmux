#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

get_option() {
  local option=$(tmux show-option -gqv "$1")
  [ -z $option ] && echo $2 || echo $option
}

set_option() {
  tmux set-option -g "$1" "$2"
}

upsert_option() {
  local option=$(get_option "$1" "$2")
  tmux set-option -g "$1" "$option"
}

padding() {
  printf '%*s' $1
}

CONFIG_NERDFONTS_LEFT=$(get_option "@sexy-nerdfonts-right" )
CONFIG_NERDFONTS_RIGHT=$(get_option "@sexy-nerdfonts-right" █)

set -gw window-status-current-format "#[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[bg=magenta#,fg=#2F343F] #I #W #[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"