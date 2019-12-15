git_repo_basename() {
  basename "$1" | sed -e 's/\.git$//'
}
