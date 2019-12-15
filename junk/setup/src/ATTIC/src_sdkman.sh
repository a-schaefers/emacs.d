__src_sdkman() {
  if ! command_available sdk; then
    curl -s "https://get.sdkman.io" | bash
  fi
}
