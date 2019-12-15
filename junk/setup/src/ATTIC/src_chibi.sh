__src_chibi() {
  # 26-mar-2019 0.8 13a8c5037368c6154256d38c9874aad4f0d812e7
  if generic_github "ashinn/chibi-scheme" "13a8c5037368c6154256d38c9874aad4f0d812e7"; then
    make && make test
    make PREFIX=$HOME/.local install
  fi
}
