generic_curl_executable() {
  name="$1"
  ver="$2"
  bin="$3"
  url="$4"
  sha256="$5"
  local_src_dir="$HOME/local/src/$name/"

  mkdir -p "$local_src_dir"
  if cd "$local_src_dir"; then
    if ! [ -f $bin ]; then
      curl -L "$url" > $bin
    fi

    if echo "$sha256  $bin" | sha256sum -c; then
      return 0
    fi
  else
    echo "unable to download to $local_src_dir" >&2
    return 1
  fi

  echo "invalid checksum for $bin" >&2
  return 2
}
