__src_quicklisp() {
  mkdir -p $HOME/local/src/quicklisp
  if cd $HOME/local/src/quicklisp; then
    curl -O https://beta.quicklisp.org/quicklisp.lisp
    curl -O https://beta.quicklisp.org/quicklisp.lisp.asc
    gpg2 --recv-keys 028B5FF7
    if gpg --verify quicklisp.lisp.asc quicklisp.lisp; then
      echo '(quicklisp-quickstart:install)' | sbcl --load quicklisp.lisp
      mv $HOME/quicklisp $HOME/.quicklisp
    fi
  fi
}
