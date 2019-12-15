__src_brogue() {
  url="https://sites.google.com/site/broguegame/brogue-1.7.5-linux-amd64.tbz2"
  sha256="a74ff18139564c597d047cfb167f74ab1963dd8608b6fb2e034e7635d6170444"
  if generic_tarball brogue src noredownload "$url" "$sha256"; then
    pwd
    #./configure --prefix=$HOME/.local
    #make
    #make install
  fi
}
