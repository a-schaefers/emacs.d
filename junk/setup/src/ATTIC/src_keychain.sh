__src_keychain() {
  # 30-Mar-2019 2.8.5 7e37e4b63529f4a1caae9ca5e6db42b10a6fd2f3
  if generic_github "funtoo/keychain" "7e37e4b63529f4a1caae9ca5e6db42b10a6fd2f3"; then
    mkdir -p $HOME/.local/share/man/man1
    mkdir -p $HOME/.local/bin
    cp keychain $HOME/.local/bin
    cp keychain.1 $HOME/.local/share/man/man1/
  fi
}
