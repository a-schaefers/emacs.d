filedir() {
  old_pwd="$(pwd)"
  cd "$(dirname "$1")"
  echo "$(pwd)/$(basename "$1")"
  cd "$old_pwd"
}
