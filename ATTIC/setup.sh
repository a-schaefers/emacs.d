#!/usr/bin/env bash

cd $(dirname $0)

for source in setup/commands/*.sh; do source "$source"; done
for source in setup/lib/*.sh; do source "$source"; done
for source in setup/src/*.sh; do source "$source"; done

if [ "$1" ]; then
  cmd=$1 && shift
  _$cmd "$@"
else
   _dotfiles
fi
