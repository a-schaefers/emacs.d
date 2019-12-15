_hier() {
  mkdir -p $HOME/{annex,local,dev}
  mkdir -p $HOME/local/{desktop,documents,downloads,music,pictures,public,src,templates,videos}

  [ -d $HOME/Desktop ] && rmdir $HOME/Desktop
  [ -d $HOME/Documents ] && rmdir $HOME/Documents
  [ -d $HOME/Downloads ] && rmdir $HOME/Downloads
  [ -d $HOME/Music ] && rmdir $HOME/Music
  [ -d $HOME/Pictures ] && rmdir $HOME/Pictures
  [ -d $HOME/Public ] && rmdir $HOME/Public
  [ -d $HOME/Templates ] && rmdir $HOME/Templates
  [ -d $HOME/Videos ] && rmdir $HOME/Videos
}
