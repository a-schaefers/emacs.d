__src_metals() {
  coursier bootstrap \
    --java-opt -Xss4m \
    --java-opt -Xms100m \
    --java-opt -Dmetals.client=emacs \
    org.scalameta:metals_2.12:0.7.0 \
    -r bintray:scalacenter/releases \
    -r sonatype:snapshots \
    -o $HOME/.local/bin/metals-emacs -f
}
