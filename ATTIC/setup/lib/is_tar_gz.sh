is_tar_gz() {
  echo "$1" | grep '\(\.tar\.gz\|\.tgz\)$' -
}
