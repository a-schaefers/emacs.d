suckless_git() {
  base_repo=$1 && shift
  name=$1 && shift
  tag=$1 && shift

  mkdir -p $HOME/local/src/suckless
  if try_cd $HOME/local/src/suckless/$name; then
    git checkout $tag
    if [ x"$tag" = x"master" ]; then
      git pull
    fi
  else
    cd $HOME/local/src/suckless
    git clone $base_repo/$name
    if try_cd $HOME/local/src/suckless/$name; then
      git checkout $tag
    fi
  fi
}
