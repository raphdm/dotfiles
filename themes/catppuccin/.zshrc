if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi 

# 2. Path to Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# 3. Load Powerlevel10k Theme (Native path)
source ~/powerlevel10k/powerlevel10k.zsh-theme

# 4. Oh My Zsh Plugins
plugins=(
    git
    fzf
    zsh-history-substring-search
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# 5. Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# 6. Load P10K Config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 

# 7. Tool initializations (Homebrew binary remains for other tools)
if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# 8. Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PATH="$HOME/.local/bin:$PATH"
