__src_fennel() {
  # not _really_ a src package, just using system luarocks to install locally,
  # if possible
  if which luarocks >/dev/null 2>&1; then
    luarocks install --local fennel
  fi
}
