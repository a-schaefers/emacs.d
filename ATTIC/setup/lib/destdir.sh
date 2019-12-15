DOTFILES_PATH_ESC=$(pwd | sed -e 's/\//\\\//g')

destdir() {
  echo "$HOME/$(echo $1 | sed -e "s/$DOTFILES_PATH_ESC//" )"
}
