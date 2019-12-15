_dotfiles() {
  OLD_IFS="$IFS"
  IFS="
"
  for f in {*,.*}; do
    not_dotfile "$f" && continue

    if [ -d "$f" ]; then
      for source in $(find "$f" -type d); do
        mkdir -p "$(destdir "$source")"
      done

      for source in $(find "$f" -type f); do
        ln -sf "$(filedir "$source")" "$(destdir "$source")"
      done
    else
      ln -sf "$(filedir "$f")" "$(destdir "$f")"
    fi
  done
  IFS="$OLD_IFS"
}
