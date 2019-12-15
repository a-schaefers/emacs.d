SUCKLESS_GIT="https://git.suckless.org"
MARTANNE_GIT="https://github.com/martanne"

__src_suckless() {
  suckless_install $SUCKLESS_GIT st 0.8.2
  suckless_install $SUCKLESS_GIT tabbed 0.6
  suckless_install $SUCKLESS_GIT dmenu 4.9
  suckless_install $SUCKLESS_GIT slock 1.4
  suckless_install $SUCKLESS_GIT slstatus master
  suckless_install $SUCKLESS_GIT dwm 6.2
  #suckless_install $MARTANNE_GIT dvtm v0.15 LIBS="-lc -lutil -lncursesw -ltinfo"
  #suckless_install $MARTANNE_GIT abduco v0.6
  #suckless_install $SUCKLESS_GIT surf 2.0  # PREFIX=$HOME/.local
}
