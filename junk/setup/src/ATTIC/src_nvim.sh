__src_nvim() {
  # 24-mar-2019 v0.3.4 ab2bbbf6c45fdf278271d19f014c9d0850d249c6
  if generic_github "neovim/neovim" "ab2bbbf6c45fdf278271d19f014c9d0850d249c6"; then
    rm -r build/
    make distclean
    make clean
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim" CMAKE_BUILD_TYPE=RelWithDebInfo -j4
    make install
  fi
}
