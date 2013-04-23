" Don't use Ex mode, use Q for formatting
map Q gq

"set nowrap
"set cindent
set mouse=a

"set foldmethod=indent "automatic folding

set tabstop=4
set shiftwidth=4
set cinoptions=g0 "No indent for public / protected / private
syntax on
set showcmd
set wildmenu
"set makeprg=scons
set autochdir
set hlsearch
set wildignore=*.o,*.class,*.swp,*.aux,*.log,*.pdf,*.dvi,*.ps,*.nav,*.snm,*.toc,*.vrb,*.out,*.tdo,*.bbl,*.blg,*-blx.bib,*.bcf,*.run.xml
"set nofoldenable " initially don't fold -- use zi to toggle folding
set linebreak
set scrolloff=5 " always scroll so to leave 5 lines visible above/below cursor
set history=200 " remember more commands

let g:is_posix = 1 " otherwise $(...) in bash scripts will be highlighted irritatingly

"automatically complete brackets / paranthesis
"inoremap ( ()<ESC>:let leavechar=")"<CR>i
"inoremap [ []<ESC>:let leavechar="]"<CR>i
"inoremap " ""<ESC>:let leavechar="\""<CR>i
"press CTRL-H to get out of current bracket
"imap <C-h> <ESC>:exec "normal f" . leavechar<CR>a

"inoremap { {<CR>}<ESC>O

"Tab-Wechsel wie in Firefox
"<C-tab> funktioniert leider nicht in gnome-terminal, aber in gvim.
map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt
map <A-0> 10gt
map <C-t> :tabnew<CR>
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
nmap <C-t> :tabnew<cr>
map <C-t> :tabnew<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
"map <C-w> :tabclose<cr> "überschreibt <C-w>
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i
imap <C-t> <ESC>:tabnew<cr>

"Pfeiltasten in wrap-Modus sollen display lines wechseln
map <Up> gk
map <Down> gj
map <Home> g<Home>
map <End> g<End>
imap <Up> <C-o>gk
imap <Down> <C-o>gj
imap <Home> <C-o>g<Home>
imap <End> <C-o>g<End>

" Für vim-latexsuite:
filetype plugin on
filetype indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode $* > /dev/null'
let g:Tex_CompileRule_pdf='pdflatex -file-line-error -interaction=nonstopmode $* > /dev/null'

" Falls ich mal tex -> dvi -> ps -> pdf brauche, etwa für PStricks...
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_MultipleCompileFormats='dvi,ps'
"let g:Tex_FormatDependency_ps='dvi,ps'
"let g:Tex_FormatDependency_pdf='dvi,ps,pdf'
"let g:Tex_CompileRule_ps='dvips -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pdf='ps2pdf $*.ps'

"synctex
"let g:Tex_CompileRule_pdf='pdflatex -synctex=1 -interaction=nonstopmode $*'

"evince-dbus, see http://github.com/jaliste/gedit-synctex-plugin/wiki
"let g:Tex_ViewRule_pdf = 'evince_dbus.py'


" do not include cross referenced references if they are cross referenced more than once
"let g:Tex_BibtexFlavor='bibtex -min-crossrefs=9999'


" concealing of math symbols in Latex mode
set cole=2
hi Conceal guibg=gray20 guifg=white
let g:tex_conceal="adgms"

" F2 zum Speichern und Kompilieren
"map <f2> :w<cr><leader>ll
"imap <f2> <ESC>:w<cr><leader>ll
" Automatisch kompilieren nach Speichern nun in ~/.vim/after/ftplugin/tex.vim
noremap <silent> <F2> :update<CR>
inoremap <silent> <F2> <C-O>:update<CR>

" Nur kompilieren
map <f3> <leader>ll
imap <f3> <C-O><leader>ll

" PDF anschauen
map <f4> <leader>lv
imap <f4> <C-O><leader>lv

" fold frames (with beamer class)
let g:Tex_FoldedEnvironments = 'verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage,frame'

" disable annoying IMAP macros (like SSS --> \section, {{ --> \left\{  \right\}
let g:Imap_FreezeImap=1
" disable vim-latex placeholders
let g:Imap_UsePlaceHolders = 0

" dibable indentation for Latex files
autocmd FileType tex setlocal indentexpr=

" Save swap files in some separate directory
set directory=~/.vim-swapfiles
set backupdir=~/.vim-swapfiles

set mousemodel=popup_setpos " makes e.g. spell suggestions easily accessible

let g:tex_comment_nospell=1 " no spell check in comments
set spelllang=en_us

"let g:Tex_IgnoredWarnings =
"\"Underfull\n".
"\"Overfull\n".
"\"specifier changed to\n".
"\"You have requested\n".
"\"Missing number, treated as zero.\n".
"\"There were undefined references\n".
"\"Citation %.%# undefined\n".
"\"Marginpar on page %.%# moved." " We want to ignore this additionally. The other 7 entries before are the default. (Whatever the fuck %.%# means...)
let g:Tex_IgnoredWarnings =
\"Underfull\n".
\"Overfull\n".
\"specifier changed to\n".
\"You have requested\n".
\"Missing number, treated as zero.\n".
\"There were undefined references\n".
\"Marginpar on page %.%# moved." " We want to ignore this additionally. The other 7 entries before are the default. (Whatever the fuck %.%# means...)
let g:Tex_IgnoreLevel = 8 " default: 7
