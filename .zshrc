# Path to Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Oh My Zsh Plugins
plugins=(
    git
    fzf
    zsh-history-substring-search
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Tool initializations (Homebrew binary remains for other tools)
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PATH="$HOME/.local/bin:$PATH"
eval "$(starship init zsh)"

# Gnome Keyring environment
if [ -n "$GNOME_KEYRING_CONTROL" ]; then
    export SSH_AUTH_SOCK="/run/user/$UID/keyring/ssh"
else
    # Fallback if systemd didn't start it (useful for Niri later)
    eval $(gnome-keyring-daemon --start --components=secrets,ssh,pkcs11 2>/dev/null)
    export GNOME_KEYRING_CONTROL SSH_AUTH_SOCK
fi
