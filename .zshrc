export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fletcherm"

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export RANGER_LOAD_DEFAULT_RC='false'

export PATH=$PATH:$HOME/bin

[ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src ] && fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
echo $ZSH_CUSTOM

plugins=(
  zsh-autosuggestions
  zsh-completions
  zsh-vi-mode
)
plugins+=(F-Sy-H)

# Enable vi mode
bindkey -v

source $ZSH/oh-my-zsh.sh

[ -f $HOME/.profile ] && source ~/.profile
[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.local_aliases ] && source $HOME/.local_aliases
[ -f $HOME/.colors ] && source $HOME/.colors
[ -f ./.nvmrc ] && nvm use &>/dev/null

source <(fzf --zsh)
