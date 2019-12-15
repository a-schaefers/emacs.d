_user_config() {
  _hier
  _dotfiles

  if [ -d $HOME/dev/dotfiles_priv ]; then
    cd $HOME/dev/dotfiles_priv/private/ssh/
    mkdir -p $HOME/.ssh/
    chmod 700 $HOME/.ssh/
    cp * $HOME/.ssh/
    chmod 600 $HOME/.ssh/*
  fi

  cd $HOME/dev/dotfiles/.bin/
  ./restore-gnome-settings

  if [ $ZMD_HIDPI_MODE ]; then
    echo '#include ".Xresources.hidpi"' > $HOME/.Xresources
  else
    echo '#include ".Xresources.lodpi"' > $HOME/.Xresources
  fi

  if [ -d /sys/class/backlight/intel_backlight ]; then
    sudo cp $HOME/dev/dotfiles/other/20-intel-backlight.conf /etc/X11/xorg.conf.d/
  fi

  cd $HOME/dev/dotfiles/
  ./setup.sh src nvim_packages
  ./setup.sh src nodenv
  ./setup.sh src pyenv
  ./setup.sh src rbenv
  ./setup.sh src fennel
  ./setup.sh src ammonite
  ./setup.sh src clojure
  ./setup.sh src leiningen
  ./setup.sh src ctags
  ./setup.sh src scala
  ./setup.sh src sbt
  ./setup.sh src rustup
}
