export ZSH="$HOME/.oh-my-zsh"

export EDITOR='nvim'
export RANGER_LOAD_DEFAULT_RC='false'

[ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src ] && fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
echo $ZSH_CUSTOM

plugins=(
  git
  zsh-autosuggestions
  zsh-completions
)
plugins+=(F-Sy-H)

source $ZSH/oh-my-zsh.sh

[ -f $HOME/.profile ] && source ~/.profile 
[ -f $HOME/.aliases ] && source $HOME/.aliases
[ -f $HOME/.colors ] && source $HOME/.colors
[ -f ./.nvmrc ] && nvm use &>/dev/null

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/my-omp.toml)"

# if command -v tmux &> /dev/null; then
  # tmux &> /dev/null
# fi


