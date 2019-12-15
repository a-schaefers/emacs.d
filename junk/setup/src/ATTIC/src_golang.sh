__src_golang() {
  url="https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz"
  sha256="de874549d9a8d8d8062be05808509c09a88a248e77ec14eb77453530829ac02b"
  generic_tarball . opt noredownload "$url" "$sha256"
}
