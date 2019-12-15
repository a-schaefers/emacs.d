__src_kawa() {
  # 17-jun-2019 3.0 39797ea94517708fc77b726c2c554067fd3fa937
  if generic_git "https://gitlab.com/kashell/Kawa.git" "39797ea94517708fc77b726c2c554067fd3fa937"; then
    rm compile
    ln -s /usr/share/automake-1.16/compile compile
    bash autogen.sh
    ./configure --prefix="$HOME/.local"
    make
    make install
  fi
}
