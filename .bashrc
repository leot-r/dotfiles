# .bashrc

#custom
fastfetch

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

# Alias
alias sd='cd "$(find . -type d 2>/dev/null | fzf)"'
alias sf='cd "$(dirname "$(find . -type f | fzf)")"'
alias wayreload='pkill -SIGUSR2 waybar'
alias wallreload='pkill hyprpaper && systemctl --user restart hyprpaper'
alias vim='nvim'
zipf() {
    zip -r9q "$1.zip" "$1"
}


# PATH
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"

#for starship -Terminal prompt
eval "$(starship init bash)"
