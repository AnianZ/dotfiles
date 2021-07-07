# Dependencies
# - https://github.com/gsamokovarov/jump
# - https://starship.rs/
# - https://github.com/nvbn/thefuck
# - https://github.com/zsh-users/zsh-autosuggestions
# - https://direnv.net/

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/anian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Shell history config
HISTSIZE=100000
SAVEHIST=$HISTSIZE
HISTFILE=/home/anian/.zsh_history
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
setopt SHARE_HISTORY # share history between zsh terminals

# Completions for concourse fly CLI
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit
_fly_compl() {
	args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
	local IFS=$'\n'
	COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
	return 0
}
complete -F _fly_compl fly

# PATH
PATH="${HOME}/.cargo/bin:${HOME}/go/bin:${HOME}/.local/bin:${PATH}"; export PATH;

# EDITOR
export EDITOR=/usr/bin/vim

# the only way swearing really accomplishes anything
eval $(thefuck --alias)

# Jump config (https://github.com/gsamokovarov/jump)
eval "$(jump shell)"

# Fish-like autosuggestions
source ~/.local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Direnv
eval "$(direnv hook zsh)"

# Starship promt
eval "$(starship init zsh)"

# Dotfile management
alias dtfiles='git --git-dir=$HOME/.config/dotfiles --work-tree=$HOME'

# Other helpful aliases
alias dcp="sudo docker-compose"
alias docker-compose="sudo docker-compose"
