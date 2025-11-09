if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias which='type -a'
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -l'
alias vf='nvim $(fzf)'
alias k=kubectl
alias kx=kubectx
alias python=python3
alias lg=lazygit
alias g=git

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

export PATH="$HOME/.go/bin:$PATH"
export GOPATH=$HOME/.go
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export KUBE_EDITOR='nvim'
export EDITOR='nvim'
export K9S_EDITOR='nvim'

eval (/opt/homebrew/bin/brew shellenv)
starship init fish | source
atuin init fish | source

# Added by Windsurf
fish_add_path /Users/romanmelnyk/.codeium/windsurf/bin

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :
