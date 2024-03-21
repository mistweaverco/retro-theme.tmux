#!/usr/bin/env bash

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

tmux set-window-option -gq window-status-format "#[fg=#555555,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[bg=#555555,fg=#2F343F] #I #W #[fg=#555555,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"
tmux set-window-option -gq window-status-current-format "#[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[bg=magenta#,fg=#2F343F] #I #W #[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"