__src_rustup() {
  bin="rustup-installer"
  url="https://sh.rustup.rs"
  sha256="5b4b37114fe25215224fb53b6a635b59d01a0377c5e9e4d6b553035ec695cdd3"
  if generic_curl_executable rustup "" $bin $url $sha256; then
    chmod u+x $bin
    ./$bin --no-modify-path -y
  fi
}
