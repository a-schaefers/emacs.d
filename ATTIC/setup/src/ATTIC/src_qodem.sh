__src_qodem() {
  if generic_github "klamonte/qodem" "v1.0.0"; then
    aclocal
    autoconf
    autoheader
    automake --add-missing

    ./configure --prefix=$HOME/.local
    make
    make install  # qodem will be term-ui binary

    make clean

    ./configure --prefix=$HOME/.local --enable-x11
    make
    make install  # qodem-x11 will be x11-ui binary
  fi
}
