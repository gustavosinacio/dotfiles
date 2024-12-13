#!/bin/sh


export WORKING_DIRS=(
  "$HOME/github"
  "$HOME/workhub"
  "$HOME/dotfiles"
  "$HOME/unixverse"
  "$HOME/obsidian"
  "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents"
)

if [ -f ~/local_dirs.sh ]; then
  source ~/local_dirs.sh
  WORKING_DIRS+=(${LOCAL_DIRS[@]})
fi

WORKING_DIRS=($(printf "%s\n" "${WORKING_DIRS[@]}" | sort -u))
