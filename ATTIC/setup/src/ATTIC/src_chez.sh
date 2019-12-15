__src_chez() {
  # 26-mar-2019 v9.5.2 c9037e5f79545b7530fd8d21db9c8148e809e7b7
  if generic_github "cisco/ChezScheme" "c9037e5f79545b7530fd8d21db9c8148e809e7b7"; then
    if [ $RASPBERRY_PI ]; then
      ./configure --installprefix=$HOME/.local --installschemename=chez-scheme --installpetitename=chez-petite --installscriptname=chez-scheme-script -m=a6le
    else
      ./configure --installprefix=$HOME/.local --installschemename=chez-scheme --installpetitename=chez-petite --installscriptname=chez-scheme-script
    fi

    make
    make install
  fi
}
