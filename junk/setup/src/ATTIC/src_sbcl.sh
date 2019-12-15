__src_sbcl() {
  # 29-mar-2019 sbcl-1.5.0 14477ffd4604d65946517c3c32ec6ed15e06e3f0
  if generic_git "git://git.code.sf.net/p/sbcl/sbcl" "14477ffd4604d65946517c3c32ec6ed15e06e3f0"; then
    sbcl_dir=$(pwd)
    sh make.sh --prefix=$HOME/.local
    cd $sbcl_dir/tests && sh ./run-tests.sh
    cd $sbcl_dir/doc/manual && make
    cd $sbcl_dir && ./install.sh
  fi
}
