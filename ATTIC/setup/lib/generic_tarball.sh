generic_tarball() {
  name="$1"
  where="$2"       # src || opt
  redownload="$3"  # redownload || noredownload
  url="$4"
  sha="$5"         # use hexa digest of sha256 or sha512 (64 bytes or 128 bytes
                   # repr respectively)

  sha_cmd="none"
  if [ "$sha" ]; then
    sha_length="$(printf "$sha" | wc -c)"
    case "$sha_length" in
      "64")
        sha_cmd="sha256sum"
        ;;
      "128")
        sha_cmd="sha512sum"
        ;;
      *)
        echo "unsupported sha checksum type" >&2
        return 1
        ;;
    esac
  fi

  dists="$HOME/local/dists"
  tarball="$(basename "$url")"
  local_src_dir="$HOME/local/$where/$name"
  sha="$sha  $tarball"
  extract_dir=""

  mkdir -p "$local_src_dir"
  mkdir -p "$dists"
  cd "$dists"

  if [ x"$redownload" = x"redownload" ]; then
    curl -O "$url"
  else
    [ -e "$tarball" ] || curl -O "$url"
  fi

  ok_to_proceed=NO
  if [ -e "$tarball" ]; then
    if [ x"$sha_cmd" != x"none" ]; then
      if echo "$sha" | "$sha_cmd" -c -; then
        ok_to_proceed=YES
      fi
    else
      ok_to_proceed=YES
    fi

    if [ x"$ok_to_proceed" = x"YES" ]; then
      untar=""
      lstar=""
      if is_tar_gz "$tarball"; then
        untar="tar xzvf"
        lstar="tar tzf"
      elif is_tar_xz "$tarball"; then
        untar="tar xJvf"
        lstar="tar tJf"
      elif is_tar_bz2 "$tarball"; then
        untar="tar xjvf"
        lstar="tar tjf"
      fi

      if [ "$untar" -a "$lstar" ]; then
        extract_dir="$($lstar "$tarball" | head -1)"
        echo "$extract_dir"
        if [ "$extract_dir" -a -d "$local_src_dir/$extract_dir" ]; then
          rm -rf "$local_src_dir/$extract_dir"
        fi
        $untar "$tarball" -C "$local_src_dir"
      else
        echo "no can untar" >&2
        return 3
      fi

      cd "$local_src_dir/$extract_dir" && return 0
    fi
  fi

  echo "invalid checksum for $tarball" >&2
  return 2
}
