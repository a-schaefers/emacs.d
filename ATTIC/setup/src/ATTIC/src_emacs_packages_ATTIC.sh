__src_emacs_packages() {
  site_lisp_dest="$HOME/.local/share/emacs/site-lisp/"
  mkdir -p $site_lisp_dest
  mkdir -p $HOME/.local/bin
  #export EMACS_VERSION=$($HOME/.local/bin/emacs --version | head -1 | cut -d' ' -f3)
  export EMACS_VERSION=$(emacs --version | head -1 | cut -d' ' -f3)

  # 27-mar-2019 0.1.1 672dd9ebd7e67d8089388b0c484cd650e76565f3
  if generic_github "vermiculus/graphql.el" "672dd9ebd7e67d8089388b0c484cd650e76565f3"; then
    EMAKE_SHA1=4208a5e4e68c0e13ecd57195209bdeaf5959395f
    if ! [ -e ${EMAKE_SHA1} ]; then
      curl "https://raw.githubusercontent.com/vermiculus/emake.el/${EMAKE_SHA1}/emake.mk" > ${EMAKE_SHA1}
      [ -e emake.mk ] && rm emake.mk
      ln -s ${EMAKE_SHA1} emake.mk
    fi
    make EMAKE_SHA1=$EMAKE_SHA1 EMACS_VERSION=$EMACS_VERSION PACKAGE_BASENAME=graphql -f emake.mk compile
    cp -r graphql.*el* $site_lisp_dest/
  fi

  # 27-mar-2019 0.1.1 b40e6b09eb9be45da67b8c9e4990a5a0d7a2a09d
  if generic_github "volrath/treepy.el" "b40e6b09eb9be45da67b8c9e4990a5a0d7a2a09d"; then
    cp -p treepy.el* $site_lisp_dest/
  fi

}
