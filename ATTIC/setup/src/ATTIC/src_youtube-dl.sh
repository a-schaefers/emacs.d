__src_youtube-dl() {
  # 22-jun-2019 master 695720ebe81166b3ee249eb3916e3c7819ef57a8
  if generic_github "ytdl-org/youtube-dl" "695720ebe81166b3ee249eb3916e3c7819ef57a8"; then
    make PREFIX=$HOME/.local
    make PREFIX=$HOME/.local install
  fi
}
