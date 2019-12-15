packages_sans_comments() {
  OLD_IFS="$IFS"
  IFS="
"
  for line in $1; do
    echo $line | grep -v '^.*#'
  done
  IFS="$OLD_IFS"
}
