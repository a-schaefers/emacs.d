__src_emacs_packages() {
  site_lisp_dest="$HOME/.local/share/emacs/site-lisp/"
  mkdir -p $site_lisp_dest
  mkdir -p $HOME/.local/bin
  #export EMACS_VERSION=$($HOME/.local/bin/emacs --version | head -1 | cut -d' ' -f3)
  export EMACS_VERSION=$(emacs --version | head -1 | cut -d' ' -f3)

  # 27-aug-2019 2.4 39a8b8812c2c9f6f0b299e6a04e504ef393694ce
  if generic_github "jwiegley/use-package" "39a8b8812c2c9f6f0b299e6a04e504ef393694ce"; then
    mkdir -p $site_lisp_dest/use-package
    cp *.el $site_lisp_dest/use-package/
  fi

  # 27-aug-2019 v1.9.3 caad15ce64c1aac5e17d480c59ee6c85ebcb6bb2
  if generic_github "jwiegley/emacs-async" "caad15ce64c1aac5e17d480c59ee6c85ebcb6bb2"; then
    make PREFIX=$HOME/.local/share/
    cp *.el* $site_lisp_dest/
  fi

  # 27-aug-2019 1.12.0 12f116d58ac03706496bd682c6449b452681874e
  if generic_github "magnars/s.el" "12f116d58ac03706496bd682c6449b452681874e"; then
    cp s.el $site_lisp_dest/
  fi

  # 27-aug-2019 v0.20.0 de6d4d40ddc844eee643e92d47b9d6a63fbebb48
  if generic_github "rejeep/f.el" "de6d4d40ddc844eee643e92d47b9d6a63fbebb48"; then
    cp f.el $site_lisp_dest/
  fi

  # 27-aug-2019 master 76ba7415480687d05a4353b27fea2ae02b8d9d61
  if generic_github "lunaryorn/pkg-info.el" "76ba7415480687d05a4353b27fea2ae02b8d9d61"; then
    cp pkg-info.el $site_lisp_dest/
  fi

  # 27-aug-2019 0.9 fd906d3f92d58ecf24169055744409886ceb06ce
  if generic_github "cask/epl" "fd906d3f92d58ecf24169055744409886ceb06ce"; then
    cp epl.el $site_lisp_dest/
  fi

  # 27-aug-2019 2.16.0 258c324d9840901db83b2cabef3fa75bba57c1ba
  if generic_github "magnars/dash.el" "258c324d9840901db83b2cabef3fa75bba57c1ba"; then
    cp -p *.el* $site_lisp_dest/
  fi

  # NOTE(zmd): popup.el is required by dumb-jump and helm-utils...
  # 27-aug-2019 master 80829dd46381754639fb764da11c67235fe63282
  if generic_github "auto-complete/popup-el" "80829dd46381754639fb764da11c67235fe63282"; then
    cp popup.el $site_lisp_dest/
  fi

  # 27-aug-2019 v2.13.0 4250c3a606011e3ff2477e3b5bbde2b493f3c85c
  if generic_github "magit/magit-popup" "4250c3a606011e3ff2477e3b5bbde2b493f3c85c"; then
    # TODO(zmd): how to install documentation?
    make LOAD_PATH="-L $HOME/.local/share/emacs/site-lisp -L ."
    cp -r *.el* $site_lisp_dest/
  fi

  # 27-aug-2019 v2.8.3 66bec91c859f305445b766394eb25248c1172426
  if generic_github "magit/with-editor" "66bec91c859f305445b766394eb25248c1172426"; then
    make LOAD_PATH="-L $HOME/.local/share/emacs/site-lisp -L ."
    cp -r *.el* $site_lisp_dest/
    cp -p *.info $HOME/.local/share/info/
  fi

  # 27-aug-2019 v3.2.0 b04c7d9a3318316ef67a5d360582d990dc9f6098
  if generic_github "magit/ghub" "b04c7d9a3318316ef67a5d360582d990dc9f6098"; then
    make LOAD_PATH="-L $HOME/.local/share/emacs/site-lisp -L ."
    cp -r *.el* $site_lisp_dest/
  fi

  # 27-aug-2019 v2.90.1 791901b2f1d26fa0a383147fe77948a9abc753da
  if generic_github "magit/magit" "791901b2f1d26fa0a383147fe77948a9abc753da"; then
    make PREFIX=$HOME/.local \
         LOAD_PATH="-L $HOME/.local/share/emacs/site-lisp -L ." \
         EMACSBIN=$(which emacs)
    make PREFIX=$HOME/.local install
  fi

  # 27-aug-2019 2.1.3 93cd2dc873e7fedca7abc599cd97d46db4376ac7
  if generic_github "Fanael/rainbow-delimiters" "93cd2dc873e7fedca7abc599cd97d46db4376ac7"; then
    cp rainbow-delimiters.el $site_lisp_dest/
  fi

  # 27-aug-2019 v2.3 cde5c5d2bcce470c494b76e23cfe1364b6291c20
  if generic_github "jrblevin/markdown-mode" "cde5c5d2bcce470c494b76e23cfe1364b6291c20"; then
    make
    cp markdown-mode.el* $site_lisp_dest/
  fi

  # 27-aug-2019 2.5.2 d2cc45ac1a035286decb12c4f49c696ad5f03d27
  if generic_github "nonsequitur/inf-ruby" "d2cc45ac1a035286decb12c4f49c696ad5f03d27"; then
    cp inf-ruby.el $site_lisp_dest/
  fi

  # TODO(zmd): LEFT OFF HERE

  # 27-mar-2019 0.9.9 ac82e875e144b227e926c09c53def9b0c059115c
  if generic_github "company-mode/company-mode" "ac82e875e144b227e926c09c53def9b0c059115c"; then
    make compile
    cp company*.el* $site_lisp_dest/
  fi

  # 27-mar-2019 0.13.0 5a29fe67d70de3749e30ebb37206395b4d1a51a8
  if generic_github "joaotavora/yasnippet" "5a29fe67d70de3749e30ebb37206395b4d1a51a8"; then
    cp yasnippet.el $site_lisp_dest/
  fi

  # 27-mar-2019 v1.5.0 35f6826e435c3004dabf134d0f2ae2f31ea7b6a2
  if generic_github "dominikh/go-mode.el" "35f6826e435c3004dabf134d0f2ae2f31ea7b6a2"; then
    cp {go-mode.el,go-mode-autoloads.el} $site_lisp_dest/
  fi

  # 27-mar-2019 0.4.0 106aeab800fb3404baf231845d3e3549ec235afa
  if generic_github "rust-lang/rust-mode" "106aeab800fb3404baf231845d3e3549ec235afa"; then
    cp rust-mode.el $site_lisp_dest/
  fi

  # 27-mar-2019 v0.6.3 adfb7ae73d6ee2ef790c780dd3c967e62930e94a
  if generic_github "defunkt/coffee-mode" "adfb7ae73d6ee2ef790c780dd3c967e62930e94a"; then
    cp coffee-mode.el $site_lisp_dest/
  fi

  # 27-mar-2019 master 95c64bb5634035630e8c59d10d4a1d1003265743
  if generic_github "immerrr/lua-mode" "95c64bb5634035630e8c59d10d4a1d1003265743"; then
    cp lua-mode.el $site_lisp_dest/
  fi

  # 27-mar-2019 master 56f90471e2ced2b0a177aed4d8c2f854797e9cc7
  if generic_github "k2052/moonscript-mode" "56f90471e2ced2b0a177aed4d8c2f854797e9cc7"; then
    cp moonscript*.el $site_lisp_dest/
  fi

  # 27-mar-2019 master 40067a10ac1360f0b9533f0bbbb2eea128e2574d
  if generic_github "yoshiki/yaml-mode" "40067a10ac1360f0b9533f0bbbb2eea128e2574d"; then
    cp yaml-mode.el $site_lisp_dest/
  fi

  # 27-mar-2019 1.8 a452ab38a7cfae97078062ff8885b5d74fd1e5a6
  if generic_github "atomontage/xterm-color" "a452ab38a7cfae97078062ff8885b5d74fd1e5a6"; then
    cp xterm-color.el $site_lisp_dest/
  fi

  # 27-mar-2019 v3.1 8de179db41598515f1db758b8d35728a3fd58f18
  if generic_github "emacs-helm/helm" "8de179db41598515f1db758b8d35728a3fd58f18"; then
    make PREFIX=$HOME/.local/ LOADPATH="-L $HOME/.local/share/emacs/site-lisp -L ."
    make PREFIX=$HOME/.local/ install
  fi

  # 27-mar-2019 1.7.4 c66336b8245ddc51c4206f19c119f1081920985c
  if generic_github "ShingoFukuyama/helm-swoop" "c66336b8245ddc51c4206f19c119f1081920985c"; then
    cp helm-swoop.el $site_lisp_dest/
  fi

  # 27-mar-2019 v2.0.0 823c0aa9ffd1e8e03b20efe97c16cfb66e2c56c5
  if generic_github "bbatsov/projectile" "823c0aa9ffd1e8e03b20efe97c16cfb66e2c56c5"; then
    cp projectile.el $site_lisp_dest/
  fi

  # 27-mar-2019 master 308f17d914e2cd79cbc809de66d02b03ceb82859
  if generic_github "bbatsov/crux" "308f17d914e2cd79cbc809de66d02b03ceb82859"; then
    cp crux.el $site_lisp_dest/
  fi

  # 27-mar-2019 v3.2 260e7c013690d412ec8d965c282572505596636d
  if generic_github "DarwinAwardWinner/amx" "260e7c013690d412ec8d965c282572505596636d"; then
    cp amx.el $site_lisp_dest/
  fi

  # 27-mar-2019 master 8e3698fb531ec7fd1dd91dd1be9808915e7d558e
  if generic_github "abo-abo/hydra" "8e3698fb531ec7fd1dd91dd1be9808915e7d558e"; then
    make compile
    cp *.el* $site_lisp_dest/
  fi

  # 27-mar-2019 master 6988b21a08b53fbfeaa6e0b0f182524257dec1e4
  if generic_github "jacktasia/dumb-jump" "6988b21a08b53fbfeaa6e0b0f182524257dec1e4"; then
    cp dumb-jump.el $site_lisp_dest/
  fi

  # 27-mar-2019 v3.3.1 2f5661646b771f6c5a00a8a9aaa3f183abd5f84d
  if generic_github "justbur/emacs-which-key" "2f5661646b771f6c5a00a8a9aaa3f183abd5f84d"; then
    cp which-key.el $site_lisp_dest/
  fi

  # 27-mar-2019 master 913d048a5958b588c17b040b88b643c628116275
  if generic_github "fxbois/web-mode" "913d048a5958b588c17b040b88b643c628116275"; then
    cp web-mode.el $site_lisp_dest/
  fi

  # 28-mar-2019 master b86aab218d67d041682e50b5c939308638bb0200
  if generic_github "elixir-editors/emacs-elixir" "b86aab218d67d041682e50b5c939308638bb0200"; then
    cp *.el $site_lisp_dest/
  fi

  # 27-mar-2019 master 6f99367511ae209f8fe2c990779764bbb4ccb6ed
  if generic_github "tonini/alchemist.el" "6f99367511ae209f8fe2c990779764bbb4ccb6ed"; then
    cp *.el $site_lisp_dest/
  fi

  # 27-mar-2019 master cbac92578aba8eff8edd18b3e1ea72c295e3631e
  if generic_github "hlissner/emacs-doom-themes" "cbac92578aba8eff8edd18b3e1ea72c295e3631e"; then
    cp *.el $site_lisp_dest/
    cp -r themes $site_lisp_dest/
  fi

  # 5-apr-2019 master 6945edd4a6532e84caca53fbb44b09ca14cd50cc
  if generic_github "slime/slime" "6945edd4a6532e84caca53fbb44b09ca14cd50cc"; then
    mkdir -p $site_lisp_dest/slime
    cp -rp {contrib,doc,lib,swank} $site_lisp_dest/slime
    cp {*.el,*.lisp,*.asd} $site_lisp_dest/slime
  fi

  # 14-jun-2019 OTP-22.0.3 b4fb2e5669acb02697d9a9ab168eb0fbff6f370c
  if generic_github "erlang/otp" "b4fb2e5669acb02697d9a9ab168eb0fbff6f370c"; then
    mkdir -p $site_lisp_dest/erlang
    cp -rp lib/tools/emacs/* $site_lisp_dest/erlang
  fi

  # 28-jun-2019 master 508577a7225b3d07eaefa9444064410af2518675
  if generic_github "alezost/bui.el" "508577a7225b3d07eaefa9444064410af2518675"; then
    cp *.el $site_lisp_dest/
  fi

  # 28-jun-2019 master 8970b2f710fea7d0ce63322584c8dbcf557fc10d
  if generic_github "flycheck/flycheck" "8970b2f710fea7d0ce63322584c8dbcf557fc10d"; then
    cp *.el $site_lisp_dest/
  fi

  # 28-jun-2019 master 5650a8cd190badb49d28d21e72a2f55c9380de7b
  if generic_github "Wilfred/ht.el" "5650a8cd190badb49d28d21e72a2f55c9380de7b"; then
    cp *.el $site_lisp_dest/
  fi

  # 28-jun-2019 master 4b335260edcdd8dcee0811d7048bb08274e941f1
  if generic_github "Malabarba/spinner.el" "4b335260edcdd8dcee0811d7048bb08274e941f1"; then
    mkdir -p $site_lisp_dest/spinner
    cp *.{el,gif} $site_lisp_dest/spinner/
  fi

  # 28-jun-2019 master 66539cfaf5962f7a5f535ce099a0129ededa0e30
  # TODO(zmd): Cask doesn't have ht or spinner listed as runtime dep; PR?
  if generic_github "emacs-lsp/lsp-mode" "66539cfaf5962f7a5f535ce099a0129ededa0e30"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 3a58ca4cfd94b9ab1e15e819d3b16ef568e8889b
  if generic_github "emacs-lsp/helm-lsp" "3a58ca4cfd94b9ab1e15e819d3b16ef568e8889b"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master f921ffa0cdc542c21dc3dd85f2c93df4288e83bd
  if generic_github "tigersoldier/company-lsp" "f921ffa0cdc542c21dc3dd85f2c93df4288e83bd"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 9ae059deaa1b5076096bcbdbf01af763a7278aff
  if generic_github "abo-abo/avy" "9ae059deaa1b5076096bcbdbf01af763a7278aff"; then
    cp avy.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 091150b33ec08daf9c87179d4e9cfc95e092d76a
  if generic_github "abo-abo/ace-window" "091150b33ec08daf9c87179d4e9cfc95e092d76a"; then
    cp ace-window.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 368254ee30692c709400db413c347e18e76a8a55
  if generic_github "Alexander-Miller/pfuture" "368254ee30692c709400db413c347e18e76a8a55"; then
    cp pfuture.el $site_lisp_dest/
  fi

  # 29-jun-2019 master bd59c685324445df671ceeb3c64bfec2e37e95cc
  if generic_github "Alexander-Miller/treemacs" "bd59c685324445df671ceeb3c64bfec2e37e95cc"; then
    cp src/elisp/*.el $site_lisp_dest/
    cp src/extra/treemacs-icons-dired.el $site_lisp_dest/
    cp src/extra/treemacs-magit.el $site_lisp_dest/
    cp src/extra/treemacs-projectile.el $site_lisp_dest/
  fi

  # 29-jun-2019 master f652cae484cb9c172c832447f7289aa00380159b
  if generic_github "emacs-lsp/lsp-treemacs" "f652cae484cb9c172c832447f7289aa00380159b"; then
    cp lsp-treemacs.el $site_lisp_dest/
  fi

  # 29-jun-2019 master ef9f509b5579f2b529a20e43f7e0f061e641fec5
  if generic_github "tkf/emacs-request" "ef9f509b5579f2b529a20e43f7e0f061e641fec5"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 3ccc3e3386732c3ee22c151e6b5215a0e4c99173
  if generic_github "emacs-lsp/lsp-ui" "3ccc3e3386732c3ee22c151e6b5215a0e4c99173"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 305eb56aecc7180c294cd06ab7a8dd62cba40f70
  if generic_github "emacs-lsp/lsp-java" "305eb56aecc7180c294cd06ab7a8dd62cba40f70"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 5ee69a29085708f8f1995c8ad5f9935d5092e3d8
  if generic_github "emacs-lsp/dap-mode" "5ee69a29085708f8f1995c8ad5f9935d5092e3d8"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 56cba2903cf6e12c715dbb5c99b34c97b2679379
  if generic_github "ensime/emacs-scala-mode" "56cba2903cf6e12c715dbb5c99b34c97b2679379"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master e658af140547cbef495c33535c7f694a501d318c
  if generic_github "ensime/emacs-sbt-mode" "e658af140547cbef495c33535c7f694a501d318c"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 8699b744c03e0399c049757b7819d69768cac3bc
  if generic_github "hylang/hy-mode" "8699b744c03e0399c049757b7819d69768cac3bc"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master f6c61817b00f9c4a3cab1bae9c309e0fc45cdd06
  if generic_github "dryman/toml-mode.el" "f6c61817b00f9c4a3cab1bae9c309e0fc45cdd06"; then
    cp toml-mode.el $site_lisp_dest/
  fi

  # 29-jun-2019 master c90d381f494a65305e6e56c41f60cbde4a163c73
  if generic_github "francogarcia/godot-gdscript.el" "c90d381f494a65305e6e56c41f60cbde4a163c73"; then
    cp godot-gdscript.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 5ffb19af48bf8a76ddc9f81745be052f050bddef
  if generic_github "magnars/multiple-cursors.el" "5ffb19af48bf8a76ddc9f81745be052f050bddef"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 18966975db7110d0aac726be95b593e2fc3d44ed
  if generic_github "plexus/a.el" "18966975db7110d0aac726be95b593e2fc3d44ed"; then
    cp a.el $site_lisp_dest/
  fi

  # 29-jun-2019 master ddf824bc1df1585867cb7f27f2dd8ca8df760569
  if generic_github "clojure-emacs/parseedn" "ddf824bc1df1585867cb7f27f2dd8ca8df760569"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master b34d3e13a249d4b92f1a008cdc1df20a92f866c5
  if generic_github "clojure-emacs/parseclj" "b34d3e13a249d4b92f1a008cdc1df20a92f866c5"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master e8bfb0e37940bf5f370ae300b896dd04afbc63c8
  if generic_github "vspinu/sesman" "e8bfb0e37940bf5f370ae300b896dd04afbc63c8"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master be9e32d1b49e35247b263b0243df7cfdc8d413ab
  if generic_github "expez/edn.el" "be9e32d1b49e35247b263b0243df7cfdc8d413ab"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master e4f1372cf22e811faca52fc86bdd5d817498a4d8
  if generic_github "eschulte/jump.el" "e4f1372cf22e811faca52fc86bdd5d817498a4d8"; then
    mkdir -p $site_lisp_dest/jump
    cp *.el $site_lisp_dest/jump/
  fi

  # 29-jun-2019 master 04dd4eefa4ed6e13e1c9045b873b0a8b25a9f91d
  if generic_github "Fuco1/smartparens" "04dd4eefa4ed6e13e1c9045b873b0a8b25a9f91d"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master e561cff4abf97d00d9b2b5f10256d417182e2772
  if generic_github "Fanael/rainbow-delimiters" "e561cff4abf97d00d9b2b5f10256d417182e2772"; then
    cp rainbow-delimiters.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 3803f24020ef0a656dc5345713c4964073aec9a8
  if generic_github "Malabarba/aggressive-indent-mode" "3803f24020ef0a656dc5345713c4964073aec9a8"; then
    cp aggressive-indent.el $site_lisp_dest/
  fi

  # 29-jun-2019 master a9cbe6a37f51da1c37035390d43500b437e8bff2
  if generic_github "clojure-emacs/clojure-mode" "a9cbe6a37f51da1c37035390d43500b437e8bff2"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 04cde7c9f6884f443d5525c46d267d1b39f989c6
  if generic_github "clojure-emacs/cider" "04cde7c9f6884f443d5525c46d267d1b39f989c6"; then
    cp *.el $site_lisp_dest/
  fi

  # 29-jun-2019 master 50d2d8aad5e0bd8002173b300f8419d72ceab7af
  if generic_github "clojure-emacs/clj-refactor.el" "50d2d8aad5e0bd8002173b300f8419d72ceab7af"; then
    cp *.el $site_lisp_dest/
  fi
}
