__src_xterm() {
  url="https://invisible-island.net/datafiles/release/xterm.tar.gz"
  sha256="ccceb8f6119ae24ab422d7ce7c5713114d304c856daf0d922efc198b56accdf5"
  if generic_tarball xterm src noredownload "$url" "$sha256"; then
    ./configure --prefix=$HOME/.local --disable-desktop --enable-256-color --enable-regis-graphics --enable-sixel-graphics
    make
    make install
    make install-ti
  fi
}
