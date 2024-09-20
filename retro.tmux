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

CONFIG_NERDFONTS_LEFT=$(get_option "@retro-nerdfonts-right" )
CONFIG_NERDFONTS_RIGHT=$(get_option "@retro-nerdfonts-right" )
CONFIG_NERDFONTS_ICON_SESSION=$(get_option "@retro-nerdfonts-icon-session" )
CONFIG_NERDFONTS_ICON_DATETIME=$(get_option "@retro-nerdfonts-icon-datetime" 󰃰)
CONFIG_NERDFONTS_ICON_APPLICATION=$(get_option "@retro-nerdfonts-icon-application" )

tmux set-option -gq status-left "#[fg=green,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[fg=#2F343F,bg=green,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_ICON_SESSION #[fg=#999999,bg=#2F343F,nobold,nounderscore,noitalics] #S #[fg=#2F343F,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"
tmux set-option -gq status-right "#[fg=orange,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[fg=#2F343F,bg=orange,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_ICON_DATETIME #[fg=#999999,bg=#2F343F,nobold,nounderscore,noitalics] %Y-%m-%d %H:%M #[fg=#2F343F,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"
tmux set-option -gq window-status-format "#[fg=blue,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[fg=#2F343F,bg=blue,nobold,nounderscore,noitalics]#I #[fg=#555555,bg=#2F343F,nobold,nounderscore,noitalics] #W #[fg=#2F343F,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"
tmux set-option -gq window-status-current-format "#[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[fg=#2F343F,bg=magenta,nobold,nounderscore,noitalics]#I #[fg=#CCCCCC,bg=#2F343F,nobold,nounderscore,noitalics] #W #[fg=#2F343F,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"