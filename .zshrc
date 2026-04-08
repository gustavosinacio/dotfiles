# Enable completion
autoload -Uz compinit
compinit

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
export EDITOR='nvim'
export RANGER_LOAD_DEFAULT_RC='false'

export PATH=$PATH:$HOME/bin

# Install dependencies with brew on macOS
if [[ "$(uname)" == "Darwin" ]] && command -v brew &>/dev/null; then
  for cmd in zoxide atuin starship; do
    if ! command -v "$cmd" &>/dev/null; then
      echo "Installing $cmd via brew..."
      brew install "$cmd"
    fi
  done
fi

# SOURCES
## fzf keybindings
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh

# fzf completion
[ ! -f ~/.zsh/fzf-tab/fzf-tab.plugin.zsh ] && git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
[ -f ~/.zsh/fzf-tab/fzf-tab.plugin.zsh ] && source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

## my sources
[ -f $HOME/.profile ] && source ~/.profile
[ -f $HOME/dotfiles/.aliases.sh ] && source $HOME/dotfiles/.aliases.sh
[ -f $HOME/.local_aliases ] && source $HOME/.local_aliases
[ -f $HOME/.colors ] && source $HOME/.colors
[ -f ./.nvmrc ] && nvm use &>/dev/null

source <(fzf --zsh)

# zsh plugins
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide (better cd)
eval "$(zoxide init zsh)"

# atuin (better history)
eval "$(atuin init zsh)"

# starship prompt
eval "$(starship init zsh)"

# Enable vi mode
bindkey -v
KEYTIMEOUT=1

# transform cursor depending on the mode
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ; then
    echo -ne '\e[1 q'  # block
  else
    echo -ne '\e[5 q'  # line
  fi
}
zle -N zle-keymap-select
echo -ne '\e[5 q'

