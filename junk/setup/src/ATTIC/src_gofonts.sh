__src_gofonts() {
  if generic_git "https://go.googlesource.com/image" "master" "gofont"; then
    mkdir -p $HOME/.fonts
    cp -p font/gofont/ttfs/*.ttf ~/.fonts/
    fc-cache -f -v
  fi
}
