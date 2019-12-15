__src_gopher() {
  url="http://gopher.quux.org:70/devel/gopher/Downloads/gopher_3.0.11.tar.gz"
  sha256="2cf1a31400be66d8fbc36deabb20a214f18c2a6f0b826fdac5ee528e42e92797"
  if generic_tarball gopher src noredownload "$url" "$sha256"; then
    ./configure --prefix="$HOME/.local"
    make
    make install
  fi
}
