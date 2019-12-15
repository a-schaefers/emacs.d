generic_git() {
  repo_url="$1"
  tag_or_branch="$2"
  containing_dir="$3"  # optional

  local_src="$HOME/local/src"
  [ "$containing_dir" ] && local_src="$local_src/$containing_dir"
  local_src_repo="$local_src/$(git_repo_basename "$repo_url")"

  mkdir -p "$local_src"
  if ! cd "$local_src_repo"; then
    cd "$local_src"
    git clone "$repo_url"
  fi

  if try_cd "$local_src_repo"; then
    git fetch --all --prune
    git checkout "$tag_or_branch"
    [ x"$tag" = x"master" ] && git pull
    return 0
  fi

  return 1
}
