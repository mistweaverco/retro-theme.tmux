tmux-sexy
=========
tmux sexy 💋.

![](preview.png)

A [tmux](https://github.com/tmux/tmux) theme that is sexy and minimal.

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
set -g @plugin 'mistweaverco/tmux-sexy'
```

### Manual Installation

1. Clone this repository to your desired location (e.g. `~/.config/tmux/plugins/tmux-sexy`).
2. Add this line to your `~/.tmux.conf`: `run ~/.config/tmux/plugins/tmux-sexy/tmux-sexy.tmux`.
3. Reload TMUX environment with `$ tmux source-file ~/.tmux.conf`.

## Configuration Options

### Overriding Icons

You can override any icon by setting the corresponding option to any string (even empty).

```tmux
set -g @sexy-nerdfonts-right ''
set -g @sexy-nerdfonts-left ''
set -g @sexy-nerdfonts-icon-session ''
set -g @sexy-nerdfonts-icon-datetime ''
set -g @sexy-nerdfonts-icon-application ''
```