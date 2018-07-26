#!/bin/sh
here=$(dirname $(readlink -f $0))

link()
{
  target="$1"
  linkfile="$2"
  if ln -s -T "$target" "$linkfile"; then
    echo "$linkfile -> $target"
  fi
}

for f in $here/{bashrc,bash_profile,gitconfig,gvimrc,inputrc,vim,vimrc,zshrc}; do
  link "$f" "$HOME/.$(basename $f)"
done

mkdir -p $HOME/.config
link "$here/fontconfig" "$HOME/.config/fontconfig"

mkdir -p $HOME/.config/geeqie
link "$here/geeqierc.xml" "$HOME/.config/geeqie/geeqierc.xml"

mkdir -p $HOME/.xmonad
link "$here/xmonad.hs" "$HOME/.xmonad/xmonad.hs"

mkdir -p $HOME/.config/zathura
link "$here/zathurarc" "$HOME/.config/zathura/zathurarc"

mkdir -p $HOME/.vim-swapfiles
