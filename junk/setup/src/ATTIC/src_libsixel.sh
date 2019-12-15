__src_libsixel() {
  if generic_github "saitoha/libsixel" "master"; then
    ./configure --prefix=$HOME/.local
    make
    make install
  fi
}
