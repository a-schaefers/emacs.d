__src_pyenv() {
  std_version=3.7.4
  global_packages="pulsemixer kivy bottle flask cherrypy hy jedhy virtualenv pip tensorflow numpy scipy matplotlib pandas sympy"

  xenv_github yyuu/pyenv.git

  $HOME/.pyenv/bin/pyenv install -s $std_version
  $HOME/.pyenv/bin/pyenv global $std_version

  $HOME/.pyenv/bin/pyenv exec pip install --upgrade $global_packages

  $HOME/.pyenv/bin/pyenv rehash
}
