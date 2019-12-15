__src_clojure() {
  ver="1.10.1.469"
  url="https://download.clojure.org/install/clojure-tools-1.10.1.469.tar.gz"
  sha256="f8be3f59d752047f70c0cbd54e7a2575eb40d6a53fd19d8cd694beda6336eb42"
  if generic_tarball clojure src noredownload "$url" "$sha256"; then
    # the following is adapted from: https://download.clojure.org/install/linux-install-1.10.1.447.sh
    prefix_dir="$HOME/.local"
    lib_dir="$prefix_dir/lib"
    bin_dir="$prefix_dir/bin"
    man_dir="$prefix_dir/share/man/man1"
    clojure_lib_dir="$lib_dir/clojure"
    install -Dm644 deps.edn "$clojure_lib_dir/deps.edn"
    install -Dm644 example-deps.edn "$clojure_lib_dir/example-deps.edn"
    install -Dm644 clojure-tools-$ver.jar "$clojure_lib_dir/libexec/clojure-tools-$ver.jar"
    sed -i -e 's@PREFIX@'"$clojure_lib_dir"'@g' clojure
    install -Dm755 clojure "$bin_dir/clojure"
    install -Dm755 clj "$bin_dir/clj"
    install -Dm644 clojure.1 "$man_dir/clojure.1"
    install -Dm644 clj.1 "$man_dir/clj.1"
  fi
}
