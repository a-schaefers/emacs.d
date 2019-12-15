__src_c99sh() {
  # 26-Mar-2019 master 563fb9d38727b35427fa0f5c58bbf44f8ddc5fd3
  if generic_github "RhysU/c99sh.git" "563fb9d38727b35427fa0f5c58bbf44f8ddc5fd3"; then
    mkdir -p "$HOME/.local/bin/"
    ln -s "$PWD/c99sh" "$HOME/.local/bin/c99sh"
    ln -s "$PWD/c99sh" "$HOME/.local/bin/c11sh"
    ln -s "$PWD/c99sh" "$HOME/.local/bin/cxxsh"

    # TODO(zmd): other libs to home dir?
  fi
}
