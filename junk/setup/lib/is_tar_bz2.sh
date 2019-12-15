is_tar_bz2() {
  echo "$1" | grep '\(\.tar\.bz2\|\.tbz2\)$' -
}
