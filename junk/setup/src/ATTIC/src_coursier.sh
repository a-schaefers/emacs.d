__src_coursier() {
  # 28-june-2019 master 33873e769d3828255c4821269c4268486c2557ec
  if generic_github "coursier/coursier" "33873e769d3828255c4821269c4268486c2557ec"; then
    mkdir -p "$HOME/.local/bin"
    cp -p coursier "$HOME/.local/bin"
    cd "$HOME/.local/bin"
    chmod u+x coursier
    ./coursier --help
  fi
}
