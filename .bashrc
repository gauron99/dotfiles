# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#default editor
EDITOR=vim

#starship stuff
eval "$(starship init bash)"

#cargo/rust stuff?
. "$HOME/.cargo/env"

# add alacritty binary to PATH
PATH="/home/dfridric/cloned/alacritty/target/release:$PATH"

# add my ~/.scripts here
PATH="~/.scripts:$PATH"

# go path
export PATH=$PATH:/usr/local/go/bin
