#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/utils.sh

CONFIG_NERDFONTS_RIGHT=$(get_option "@sexy-nerdfonts-right" )
CONFIG_NERDFONTS_LEFT=$(get_option "@sexy-nerdfonts-right" █)

tmux set -gw window-status-current-format "#[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_LEFT#[bg=magenta#,fg=#2F343F] #I #W #[fg=magenta,bg=#2F343F,nobold,nounderscore,noitalics]$CONFIG_NERDFONTS_RIGHT"