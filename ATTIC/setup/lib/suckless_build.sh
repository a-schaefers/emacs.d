suckless_build() {
  if try_cd $HOME/local/src/suckless/$1; then
    make clean
    make "$@"
    make PREFIX=$HOME/.local install
  fi
}
