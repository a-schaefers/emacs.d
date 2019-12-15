__src_scala() {
  url="https://downloads.lightbend.com/scala/2.13.0/scala-2.13.0.tgz"
  sha256="f7d4653325bf516f9a28572f7401c2b0e5fab8e0a5d65837eb1df70e6252e089"
  if generic_tarball emacs src noredownload "$url" "$sha256"; then
    mkdir -p $HOME/.local/opt/scala/
    cp -rp . $HOME/.local/opt/scala/
  fi
}
