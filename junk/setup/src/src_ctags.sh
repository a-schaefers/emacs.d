__src_ctags() {
  # 14-sep-2019 master 6adbc5922f60a0f7490d1c83c0b8cdbd440d7450
  if generic_github "universal-ctags/ctags.git" "6adbc5922f60a0f7490d1c83c0b8cdbd440d7450"; then
    ./autogen.sh
    ./configure --program-prefix=universal- --prefix=$HOME/.local
    make
    make install
  fi
}
