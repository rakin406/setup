export ZSH="$HOME/.oh-my-zsh"
plugins=(last-working-dir)
ZSH_THEME="agnoster"
source "$ZSH/oh-my-zsh.sh"

# NEOVIM IS THE BEST
export VISUAL=nvim
export EDITOR=nvim
export MANPAGER='nvim +Man!'

# Programming related stuff
export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export GO111MODULE=on
export GOPATH=$HOME/.go
export PYENV_ROOT="$HOME/.pyenv"

# Fzf fuzzy finder
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'

# Aliases to save my time
alias fzf='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'
alias nnn='nnn -e'
alias ls='lsd'

# Save space :)
prompt_context() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
    fi
}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# Load all external plugins
source "$HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Start tmux by default
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    exec tmux
fi

# Created by `userpath` on 2022-09-26 04:44:01
export PATH="$PATH:/home/rakin/.local/bin"
