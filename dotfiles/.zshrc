export ZSH="$HOME/.oh-my-zsh"
plugins=(last-working-dir)
ZSH_THEME="agnoster"
source "$ZSH/oh-my-zsh.sh"

# NEOVIM IS THE BEST
export VISUAL=nvim
export EDITOR=nvim
export MANPAGER='nvim +Man!'

# Programming related stuff
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
# export GO111MODULE=on
# export GOPATH=$HOME/.go
# export PYENV_ROOT="$HOME/.pyenv"

# # Start C++ project without copying like a monkey
cpp_setup() {
    # Copy cpp stuff
    cp $HOME/code/tools/cppheadstart/CMakeLists.txt .
    cp $HOME/code/tools/cppheadstart/.editorconfig .
    cp $HOME/code/tools/cppheadstart/.gitignore .
    cp $HOME/code/tools/cppheadstart/.clang-format .
    # cp $HOME/code/tools/cppheadstart/.clang-tidy .

    # Source code folder
    mkdir -p src
    touch src/main.cpp

    # Build directory for executables
    mkdir -p build
}

# Fzf is really fast
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'
# export FZF_DEFAULT_COMMAND='fd --type f'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Aliases to save my time
alias fzf='fzf --preview "bat --style=numbers --color=always --line-range :500 {}"'
alias nnn='nnn -e'
# alias ls='lsd'

# Save space :)
prompt_context() {
    if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
        # prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
    fi
}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# Load all external plugins
source "$HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Start tmux by default
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
    # exec tmux
# fi
