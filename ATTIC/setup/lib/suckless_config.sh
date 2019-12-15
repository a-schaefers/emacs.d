suckless_config() {
  if [ -e $HOME/.config/suckless/$1/config.h ]; then
    echo "config for $1"
    cp $HOME/.config/suckless/$1/config.h $HOME/local/src/suckless/$1/
  else
    echo "no config for $1"
  fi
}
