suckless_patch() {
  if try_cd $HOME/local/src/suckless/$1; then
    rm *
    git reset --hard
    for p in $HOME/.config/suckless/$1/*.diff; do
      git apply "$p"
    done
  fi
}
