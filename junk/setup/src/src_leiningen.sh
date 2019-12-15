__src_leiningen() {
  # 17-jun-2019 2.9.1 f3864bc35d8280a8461b7f6c593b1919a75bef7f
  if generic_github "technomancy/leiningen" "f3864bc35d8280a8461b7f6c593b1919a75bef7f"; then
    mkdir -p "$HOME/.local/bin"
    cp -p bin/lein "$HOME/.local/bin/"
    cd "$HOME/.local/bin"
    chmod u+x lein
    ./lein
  fi
}
