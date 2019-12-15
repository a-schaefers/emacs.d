# curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
__src_plug_vim() {
  if generic_github "junegunn/vim-plug.git" "master"; then
    mkdir -p "$HOME/.config/nvim/autoload"
    cp "$PWD/plug.vim" "$HOME/.config/nvim/autoload/"
  fi
}
