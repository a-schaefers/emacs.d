__src_wmutils() {
  if generic_github "wmutils/core.git" "v1.4"; then
    make clean
    make
    make PREFIX=$HOME/.local install
  fi
}
