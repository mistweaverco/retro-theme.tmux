# retro-theme.tmux

A [tmux](https://github.com/tmux/tmux) theme that is retro.

![](preview.png)

## Installation

In order to have the icons displayed correctly
please use/update your favorite [patched font](https://www.nerdfonts.com/font-downloads).
If you do not have a patched font installed,
you can override any icon.
Check the documentation below on the options available.

### Using Tmux Plugin Manager (TPM)

1. Install [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
2. Add this plugin to your `~/.tmux.conf`:

```tmux
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'mistweaverco/retro-theme.tmux'
```

### Manual Installation

1. Clone this repository to your desired location (e.g. `~/.config/tmux/plugins/retro-theme.tmux`).
2. Add this line to your `~/.tmux.conf`: `run ~/.config/tmux/plugins/retro-theme.tmux/retro.tmux`.
3. Reload TMUX environment with `$ tmux source-file ~/.tmux.conf`.

## Configuration Options

### Overriding Icons

You can override any icon by setting the corresponding option to any string (even empty).

```tmux
set -g @retro-nerdfonts-right ''
set -g @retro-nerdfonts-left ''
set -g @retro-nerdfonts-icon-session ''
set -g @retro-nerdfonts-icon-datetime ''
set -g @retro-nerdfonts-icon-application ''
```