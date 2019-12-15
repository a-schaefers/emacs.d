not_dotfile() {
  [ "$1" = "." -o \
    "$1" = ".." -o \
    "$1" = ".git" -o \
    "$1" = ".gitignore" -o \
    "$1" = "ATTIC" -o \
    "$1" = "docs" -o \
    "$1" = "other" -o \
    "$1" = "setup" -o \
    "$1" = "setup.sh" -o \
    "$1" = "setup-fedora.sh" -o \
    "$1" = "tags" -o \
    "$1" = "TAGS" -o \
    "$1" = "TODO.txt" ]
}
