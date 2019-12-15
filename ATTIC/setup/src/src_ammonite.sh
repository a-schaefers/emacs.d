__src_ammonite() {
  ver="1.7.1"
  bin="amm-$ver"
  url="https://github.com/lihaoyi/Ammonite/releases/download/$ver/2.13-$ver"
  sha256="b716ed17ddb3a6f9467b66f44508940fbb0f2d6212d69b790d99411a9761be05"
  if generic_curl_executable ammonite $ver $bin $url $sha256; then
    chmod u+x $bin
    mkdir -p $HOME/.local/bin/
    cp -p $bin $HOME/.local/bin/amm
  fi
}
