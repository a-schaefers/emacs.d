__src_bloop() {
  ver=v1.3.2
  bin="bloop-install-$ver.py"
  url="https://github.com/scalacenter/bloop/releases/download/$ver/install.py"
  sha256="896d69e81b5366663c62e4b462f6e15fcf61b8b64c1545f7a8c3ff3398c6d355"
  if generic_curl_executable ammonite $ver $bin $url $sha256; then
    python "$bin"
  fi
}
