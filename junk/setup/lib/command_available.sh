command_available() {
  which "$1" 1>/dev/null 2>&1
}
