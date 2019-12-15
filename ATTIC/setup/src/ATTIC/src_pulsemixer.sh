__src_pulsemixer() {
  # 31-mar-2019 master a2c6db5c4b407a867cef08f1135ee1d9288af92e
  if generic_github "GeorgeFilipkin/pulsemixer" "a2c6db5c4b407a867cef08f1135ee1d9288af92e"; then
    mkdir -p $HOME/.local/bin
    cp pulsemixer $HOME/.local/bin/
  fi
}
