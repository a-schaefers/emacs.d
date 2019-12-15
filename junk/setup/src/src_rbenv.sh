__src_rbenv() {
  std_version=2.6.4
  global_packages="opal mini_racer c_lexer rails sinatra mailcatcher curses gtk3"

  xenv_github rbenv/rbenv.git rbenv/ruby-build.git rbenv/rbenv-vars.git

  $HOME/.rbenv/bin/rbenv install -s $std_version
  $HOME/.rbenv/bin/rbenv global $std_version

  $HOME/.rbenv/bin/rbenv exec gem install $global_packages
  $HOME/.rbenv/bin/rbenv exec gem update

  $HOME/.rbenv/bin/rbenv rehash
}
