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

grow_session_name_dynamic() {
  local session_name
  local session_name_length
  session_name=$(tmux display-message -p '#S')
  session_name_length=${#session_name}
  tmux set-option -g status-left-length $((session_name_length + 2))
}

CONFIG_NERDFONTS_LEFT=$(get_option "@retro-nerdfonts-left" )
CONFIG_NERDFONTS_RIGHT=$(get_option "@retro-nerdfonts-right" )
CONFIG_NERDFONTS_ICON_SESSION=$(get_option "@retro-nerdfonts-icon-session" )
CONFIG_NERDFONTS_ICON_APPLICATION=$(get_option "@retro-nerdfonts-icon-application" )

tmux set-option -gq status-left "#[fg=green,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[fg=#2F343F,bg=green,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_ICON_SESSION#[fg=green,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT#[fg=#999999,bg=#2F343F,nobold,nounderscore,noitalics] #S #[fg=#2F343F,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"
tmux set-option -gq status-right "#[fg=#2F343F,bg=black,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"
tmux set-option -gq window-status-format "#[fg=#555555,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[fg=#333333,bg=#555555,nobold,nounderscore,noitalics]#I#[fg=#555555,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT#[fg=#555555,bg=#2F343F,nobold,nounderscore,noitalics] $CONFIG_NERDFONTS_ICON_APPLICATION #W"
tmux set-option -gq window-status-current-format "#[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[fg=#2F343F,bg=magenta,nobold,nounderscore,noitalics]#I#[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT#[fg=#CCCCCC,bg=#2F343F,nobold,nounderscore,noitalics] $CONFIG_NERDFONTS_ICON_APPLICATION #W"

tmux set-hook -g client-attached "run-shell $PLUGIN_DIR/grow_session_name.sh"
tmux set-hook -g session-created "run-shell $PLUGIN_DIR/grow_session_name.sh"
tmux set-hook -g session-renamed "run-shell $PLUGIN_DIR/grow_session_name.sh"