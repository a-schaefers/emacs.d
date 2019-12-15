xenv_github() {
  base_repo="$1" && shift
  plugins="$@"
  base_dest="$HOME/.$(git_repo_basename "$base_repo")"
  plugins_dest="$base_dest/plugins"

  if ! cd "$base_dest"; then
    git clone "https://github.com/$base_repo" "$base_dest"
  fi

  if try_cd "$base_dest"; then
    git pull
    for plugin_repo in $plugins; do
      plugin_dest="$plugins_dest/$(git_repo_basename "$plugin_repo")"
      if ! cd "$plugin_dest"; then
        git clone "https://github.com/$plugin_repo" "$plugin_dest"
      fi

      if try_cd "$plugin_dest"; then
        git pull
      fi
    done

    return 0
  fi

  return 1
}
