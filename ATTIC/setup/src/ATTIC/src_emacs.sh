__src_emacs() {
  url="https://mirrors.kernel.org/gnu/emacs/emacs-26.2.tar.gz"
  sha256="4f99e52a38a737556932cc57479e85c305a37a8038aaceb5156625caf102b4eb"
  if generic_tarball emacs src noredownload "$url" "$sha256"; then
    #./configure --prefix=$HOME/.local --with-x-toolkit=athena --without-dbus
    #./configure --prefix=$HOME/.local --with-gnutls=yes --with-mailutils=yes --with-x-toolkit=athena --without-toolkit-scroll-bars
    ./configure --prefix=$HOME/.local --with-gnutls=yes --with-mailutils=yes
    make
    make install
  fi
}
