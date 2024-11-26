# Alias
alias cd="z"
alias co="conda"
alias coa="conda activate"
alias cod="conda deactivate"
alias cols="conda list"
alias dk="docker"
alias hms="home-manager switch"
alias nxg="nix-collect-garbage"
alias nxu="nix-channel --update"
alias t="tmux"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias tkill="tmux kill-session -t"
alias tls="tmux list-sessions"

# Color
export CLICOLOR=1
export PS1="%F{15}[%f%F{51}%n%f%F{15}@%f%F{203}%m%f%F{15}:%f%F{220}%~%f%F{15}]%#%f"
export PS2="%F{15}%_>%f"
export LSCOLORS="GxgxxxxxxxxxxxxxxxHxHx"
export LS_COLORS="di=1;36:ln=36:so=0:pi=0:ex=0:bd=0:cd=0:su=0:sg=0:tw=1;37:ow=1;37:no=0:fi=0:do=0:or=0:mi=0:st=0"
export TERM=xterm-256color
autoload -Uz compinit
compinit
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# History
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups

# Key binding
## Completion using arrow keys based on history
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Software
## homebrew
eval "$(/opt/homebrew/bin/brew shellenv 2> /dev/null)" 
## nix 
source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' 2> /dev/null
## conda
eval "$($(brew --prefix)/Caskroom/miniconda/base/bin/conda "shell.zsh" "hook" 2> /dev/null)"
## fzf
export FZF_ALT_C_COMMAND='find . -type d | sed '\''s/^.\///'\'''
export FZF_DEFAULT_OPTS='--height 30% -m --border --reverse --prompt="❯ " --pointer="❯" --marker="❯" --color="prompt:15,spinner:203,info:203,marker:203,pointer:51"'
source $HOME/.nix-profile/share/fzf/completion.zsh 2> /dev/null
source $HOME/.nix-profile/share/fzf/key-bindings.zsh 2> /dev/null
## starship
eval "$(starship init zsh 2> /dev/null)"
## zoxide
eval "$(zoxide init zsh)"
## zsh-autosuggestions 
export ZSH_AUTOSUGGEST_MANUAL_REBIND=true
source $HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
