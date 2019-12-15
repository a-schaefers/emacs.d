__src_sbt() {
  url="https://sbt-downloads.cdnedge.bluemix.net/releases/v1.3.0/sbt-1.3.0.tgz"
  sha256="c9bc6bcbbe7a65773f4526ad5613d93f220ce21bd2456c3cf35363c4cdd52648"
  if generic_tarball sbt src noredownload "$url" "$sha256"; then
    mkdir -p $HOME/.local/opt/sbt/
    cp -rp . $HOME/.local/opt/sbt/
  fi
}
