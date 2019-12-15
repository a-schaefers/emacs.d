__src_lfe() {
  # 08-jun-2019 develop 0775432025f43cafbb7063b5923286bbd700cdf0
  if generic_github "rvirding/lfe.git" "0775432025f43cafbb7063b5923286bbd700cdf0"; then
    make compile
    make install PREFIX=$HOME/.local
    cp -p emacs/*.el $HOME/.local/share/emacs/site-lisp/
  fi
}
