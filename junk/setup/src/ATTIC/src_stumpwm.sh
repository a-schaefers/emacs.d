__src_stumpwm() {
  # 29-mar-2019 master f50d8927b2d03f07bf188460c91f88b91f339afa
  if generic_github "stumpwm/stumpwm" "f50d8927b2d03f07bf188460c91f88b91f339afa"; then
    if echo '(ql:quickload "clx")
             (ql:quickload "cl-ppcre")
             (ql:quickload "alexandria")' | sbcl; then
      autoconf
      ./configure --prefix=$HOME/.local
      make
      make install
    fi
  fi
}
