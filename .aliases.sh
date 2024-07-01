#!/bin/bash

# Files, finder ----------------------------------------------------------------
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -la'

alias weather='curl -4 wttr.in/brasilia'

# Github -----------------------------------------------------------------------
alias lg="lazygit"

# Architectures ----------------------------------------------------------------
alias intel="/usr/bin/arch -x86_64 /bin/zsh"
alias arm="/usr/bin/arch -arm64 /bin/zsh"
# alias ipod='/usr/local/bin/pod'
# alias ibrew='arch -x86_64 /usr/local/opt/brew/bin/brew'
# alias mbrew='arch -arm64 /opt/homebrew/bin/brew'

alias testnode="node -e \"console.log(process.arch)\""
alias creat-intel-node="ln -s $(which node) /usr/local/bin/node"
alias creat-arm-node="ln -s $(which node) /opt/homebrew/bin/node"

alias android-build="npx react-native run-android --variant=stagingDebug --no-jetifier"

# Docker -----------------------------------------------------------------------
alias docker-ip="docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dcd="docker-compose down"
alias dcu="docker-compose up"
alias dcuf="docker-compose up --force-recreate"

# Watchman ----
alias watchman-res="watchman watch-del $(pwd); watchman watch-project $(pwd)"

# Ranger -----
alias rr="ranger"

alias echo="echo -e"

alias cdw='cd ~/workhub'
alias cdob='cd "/Users/gustavoinacio/Library/Mobile Documents/com~apple~CloudDocs/obsidian"'

alias cls='clear'
