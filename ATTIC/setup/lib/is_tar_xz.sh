is_tar_xz() {
  echo "$1" | grep '\(\.tar\.xz\|\.txz\)$' -
}
