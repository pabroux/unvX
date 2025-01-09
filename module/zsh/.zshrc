###############################################################################
# Aliases
###############################################################################

# ◆ Zoxide
alias cd="z"

# ◆ Miniconda
alias co="conda"
alias coa="conda activate"
alias cod="conda deactivate"
alias cols="conda list"

# ◆ Docker
alias dk="docker"
alias dkc="docker compose"

# ◆ Home-manager
alias hms="home-manager switch"
alias hmsq="yes 'n' | hms"

# ◆ Coreutils
alias ls="gls --color --group-directories-first"

# ◆ Nix
alias nxg="nix-collect-garbage"
alias nxu="nix-channel --update"

# ◆ Tmux
alias tx="tmux"
alias txa="tmux attach"
alias txat="tmux attach -t"
alias txkill="tmux kill-session -t"
alias txls="tmux list-sessions"


###############################################################################
# Key Bindings
###############################################################################

# ◆ Completion using arrow keys based on history
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward


###############################################################################
# Options
###############################################################################

# ◆ Color
export CLICOLOR=1
export PS1="%F{15}[%f%F{51}%B%n%b%f%F{15}@%f%F{203}%B%m%b%f%F{15}:%f%F{220}%B%~%b%f%F{15}]%#%f "
export PS2="%F{15}%_>%f"
export LSCOLORS="GxgxxxxxxxxxxxxxxxHxHx"
export LS_COLORS="di=1;36:ln=36:so=0:pi=0:ex=0:bd=0:cd=0:su=0:sg=0:tw=1;37:ow=1;37:no=0:fi=0:do=0:or=0:mi=0:st=0"
export TERM=xterm-256color
autoload -Uz compinit
compinit
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ◆ History
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups


###############################################################################
# Software
###############################################################################

# ◆ High priority
# ↳ Homebrew
eval "$(/opt/homebrew/bin/brew shellenv 2> /dev/null)" 
# ↳ Nix 
source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' 2> /dev/null

# ◆ Normal priority
# ↳ Fzf
export FZF_ALT_C_COMMAND='find . -type d | sed '\''s/^.\///'\'''
export FZF_DEFAULT_OPTS='--height 30% -m --border --reverse --prompt="❯ " --pointer="❯" --marker="❯" --color="prompt:15,spinner:203,info:203,marker:203,pointer:51"'
source $HOME/.nix-profile/share/fzf/completion.zsh 2> /dev/null
source $HOME/.nix-profile/share/fzf/key-bindings.zsh 2> /dev/null
# ↳ Git
export GIT_CONFIG_SYSTEM=$HOME/.config/git/gitconfig
# ↳ Miniconda
eval "$($(brew --prefix)/Caskroom/miniconda/base/bin/conda "shell.zsh" "hook" 2> /dev/null)"
# ↳ Starship
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh 2> /dev/null)"
# ↳ Zoxide
eval "$(zoxide init zsh)"
# ↳ Zsh-autosuggestions 
export ZSH_AUTOSUGGEST_MANUAL_REBIND=true
source $HOME/.nix-profile/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null
