__src_nvim_packages() {
  # 09-sep-2019 v2.4 4d584ea8c85408ca0d68b7b1693f3e2db8aa762a
  if generic_github "tpope/vim-pathogen" "4d584ea8c85408ca0d68b7b1693f3e2db8aa762a"; then
    mkdir -p "$HOME/.config/nvim/autoload"
    cp "$PWD/autoload/pathogen.vim" "$HOME/.config/nvim/autoload/"
  fi

  # 09-sep-2019 master 4e1a877f51a17a961b8c2a285ee80aebf05ccf42
  if generic_github "christoomey/vim-tmux-navigator" "4e1a877f51a17a961b8c2a285ee80aebf05ccf42"; then
    mkdir -p "$HOME/.config/nvim/bundle"
    ln -s "$(pwd)" "$HOME/.config/nvim/bundle/" 2>/dev/null
  fi

  # 09-sep-2019 master e8d59d115c8153a7de9872b3c4419f2354c0f14b
  if generic_github "elixir-lang/vim-elixir" "e8d59d115c8153a7de9872b3c4419f2354c0f14b"; then
    mkdir -p "$HOME/.config/nvim/bundle"
    ln -s "$(pwd)" "$HOME/.config/nvim/bundle/" 2>/dev/null
  fi

  # 09-sep-2019 master 80b5bc1b682898e3089f6caf1120919fc0933562
  if generic_github "junegunn/fzf" "80b5bc1b682898e3089f6caf1120919fc0933562"; then
    mkdir -p "$HOME/.config/nvim/bundle"
    ln -s "$(pwd)" "$HOME/.config/nvim/bundle/" 2>/dev/null
  fi

  # 09-sep-2019 master 359a80e3a34aacbd5257713b6a88aa085337166f
  if generic_github "junegunn/fzf.vim" "359a80e3a34aacbd5257713b6a88aa085337166f"; then
    mkdir -p "$HOME/.config/nvim/bundle"
    ln -s "$(pwd)" "$HOME/.config/nvim/bundle/" 2>/dev/null
  fi

  # 14-sep-2019 5.3.2 60ec10b477eefc81eeafafa2a8c1b00046ee48fb
  if generic_github "scrooloose/nerdtree" "60ec10b477eefc81eeafafa2a8c1b00046ee48fb"; then
    mkdir -p "$HOME/.config/nvim/bundle"
    ln -s "$(pwd)" "$HOME/.config/nvim/bundle/" 2>/dev/null
  fi
}
