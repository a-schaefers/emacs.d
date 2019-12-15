suckless_install() {
  base_repo=$1 && shift
  name=$1 && shift
  tag=$1 && shift
  suckless_git $base_repo $name $tag && \
  ( suckless_patch $name || true ) && \
  suckless_config $name && \
  suckless_build $name "$@"
}
