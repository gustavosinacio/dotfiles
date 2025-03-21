#!/bin/bash

export GIT_STATUS_DIRS=(
  $HOME/dotfiles
  $HOME/unixverse
  $HOME/workhub/backend
  $HOME/workhub/frontend
  $HOME/workhub/general
  $HOME/github/finance
)

if [ -f ~/local_git_status_dirs.sh ]; then
  source ~/local_git_status_dirs.sh
  GIT_STATUS_DIRS+=(${LOCAL_GIT_STATUS_DIRS[@]})
fi

GIT_STATUS_DIRS=($(printf "%s\n" "${GIT_STATUS_DIRS[@]}" | sort -u))
