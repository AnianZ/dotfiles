# Dependencies
# - https://github.com/gsamokovarov/jump
# - https://starship.rs/
# - https://github.com/nvbn/thefuck
# - https://github.com/zsh-users/zsh-autosuggestions
# - https://direnv.net/

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Shell history config
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
setopt SHARE_HISTORY # share history between zsh terminals

# Cycle to the history of a command when using the arrow keys after the command has been typed
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

# PATH
PATH="${HOME}/.cargo/bin:${HOME}/go/bin:${HOME}/.local/bin:${PATH}"; export PATH;

# EDITOR
export EDITOR=/usr/bin/nvim

# the only way swearing really accomplishes anything
eval $(thefuck --alias)

# Jump config (https://github.com/gsamokovarov/jump)
eval "$(jump shell)"

# Fish-like autosuggestions
if [[ "$OSTYPE" == "darwin"* ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
  source ~/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Direnv
eval "$(direnv hook zsh)"

# Starship promt
eval "$(starship init zsh)"

# Use the local podman socket for docker on fedora
# https://fedoramagazine.org/use-docker-compose-with-podman-to-orchestrate-containers-on-fedora/
export DOCKER_HOST=unix:/run/user/$UID/podman/podman.sock

# Dotfile management
alias dtfiles='git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'

# Other helpful aliases
alias vi="nvim"
alias dcp="podman-compose"
# Switch between dark and light mode
alias lettherebelight="gsettings set org.gnome.desktop.interface color-scheme prefer-light"
alias notsobright="gsettings set org.gnome.desktop.interface color-scheme prefer-dark"
# Find all git branches that have been merged and present them for deletion
alias clean-git="git remote prune origin && git branch --merged >/tmp/merged-branches && vim /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mcli mcli
