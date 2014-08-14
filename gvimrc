set guioptions-=m
set guioptions-=T
set guioptions-=e " To avoid an XMonad issue: http://unix.stackexchange.com/questions/27198/gvim-opening-a-tab-pushes-status-line-out-of-window
"set guifont=Monaco
" In fact, we should not need the following patched version of the Monaco font
" in order to work properly with powerline. 'fontconfig' should take care of
" that, but in gvim there is the following problem without the patched font.
" https://github.com/Lokaltog/powerline/issues/698
" https://github.com/bling/vim-airline/issues/256
" https://github.com/Lokaltog/powerline/issues/701
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline
set lines=48
set columns=120
