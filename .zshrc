export ZSH="$HOME/.oh-my-zsh"

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

source $ZSH/oh-my-zsh.sh

[ -f $HOME/.profile ] && source ~/.profile 
[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.colors ] && source $HOME/.colors
[ -f ./.nvmrc ] && nvm use &>/dev/null

eval "$(oh-my-posh init zsh --config $HOME/dotfiles/oh-my-posh.toml)"

source <(fzf --zsh)

