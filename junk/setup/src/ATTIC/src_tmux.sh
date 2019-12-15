__src_tmux() {
  # 24-mar-2019 2.8 01918cb0170e07288d3aec624516e6470bf5b7fc
  if generic_github "tmux/tmux" "01918cb0170e07288d3aec624516e6470bf5b7fc"; then
    ./autogen.sh
    ./configure --prefix=$HOME/.local
    make
    make install
  fi
}
