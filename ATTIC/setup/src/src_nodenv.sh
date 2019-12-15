__src_nodenv() {
  std_version=10.16.3
  global_packages="biwascheme coffeescript"

  xenv_github nodenv/nodenv.git nodenv/node-build.git

  $HOME/.nodenv/bin/nodenv install -s $std_version
  $HOME/.nodenv/bin/nodenv global $std_version

  $HOME/.nodenv/bin/nodenv exec npm install -g $global_packages
  $HOME/.nodenv/bin/nodenv exec npm update -g

  $HOME/.nodenv/bin/nodenv rehash
}
