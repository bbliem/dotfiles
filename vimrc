colorscheme desert
syntax on
syntax spell toplevel " http://stackoverflow.com/questions/5860154/vim-spell-checking-comments-only-in-latex-files
"let g:tex_comment_nospell=1 " No spell check in comments
let g:is_posix = 1 " Otherwise $(...) in bash scripts will be highlighted in an irritating way

"{{{ "set" commands
set mouse=a
set tabstop=4
set shiftwidth=4
set cinoptions=g0 " No indent for public / protected / private
"set cindent
set foldmethod=marker
set showcmd
set wildmenu
set hlsearch
set wildignore=*.o,*.class,*.swp,*.aux,*.log,*.pdf,*.dvi,*.ps,*.nav,*.snm,*.toc,*.vrb,*.out,*.tdo,*.bbl,*.blg,*-blx.bib,*.bcf,*.run.xml,*.tex.latexmain,*.auxlock,*.synctex.gz
set linebreak " Do not break in the middle of words
set showbreak=\ \ ↪\  " Show this before wrapped lines
" showbreak should use the same background as normal text
set scrolloff=3 " Always scroll as to leave a few lines visible above/below cursor
set history=200 " Remember more commands
set spelllang=en_us
"set spell
set autochdir
set matchpairs+=<:> " Match angled braces

" Save swap files in some separate directory
set directory=~/.vim-swapfiles
set backupdir=~/.vim-swapfiles

set mousemodel=popup_setpos " Makes, e.g., spell suggestions easily accessible
"}}}
"{{{ Concealing of math symbols in LaTeX mode
let g:tex_conceal="adgms"
set cole=2
hi Conceal guibg=gray20 guifg=navajowhite
hi NonText guibg=gray20
"}}}
"{{{ Key mappings
" Don't use Ex mode, use Q for :q!
map Q ZQ
" Use space bar to toggle or create folds
nmap <silent> <Space> za
vmap <silent> <Space> zf
" Save with F2
noremap <silent> <F2> :update<CR>
inoremap <silent> <F2> <C-O>:update<CR>
" Compile with F3
map <f3> <leader>ll
imap <f3> <C-O><leader>ll
" View with F4
map <f4> <leader>lv
imap <f4> <C-O><leader>lv
" Switch between .h and .cpp with F8
" See http://vim.wikia.com/wiki/Easily_switch_between_source_and_header_file
" Using :drop so when both are open the cursor just jumps to the other window
map <F8> :drop %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" Split-open header if .cpp is open and vice versa with F9
map <F9> :spl %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Shortcuts for tab switching
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
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i
imap <C-t> <ESC>:tabnew<cr>

" Arrow keys affect *display* lines (for real lines, use j/k)
map <Up> gk
map <Down> gj
map <Home> g<Home>
map <End> g<End>
imap <Up> <C-o>gk
imap <Down> <C-o>gj
imap <Home> <C-o>g<Home>
imap <End> <C-o>g<End>
"}}}
"{{{ Settings for vim-latexsuite
filetype plugin on
"filetype indent on
"let g:tex_indent_items = 0
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex' " Use LaTeX for all files with .tex extension
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_CompileRule_pdf='pdflatex -file-line-error -interaction=nonstopmode $* > /dev/null'
" -shell-escape is for externalizing graphics with TikZ (see http://tex.stackexchange.com/questions/1460/script-to-automate-externalizing-tikz-graphics or the TikZ manual)
" let g:Tex_CompileRule_pdf='pdflatex -shell-escape -file-line-error -interaction=nonstopmode $* > /dev/null'
let g:Tex_CompileRule_pdf='pdflatex -shell-escape -synctex=1 -file-line-error -interaction=nonstopmode $* > /dev/null'
let g:Tex_ViewRule_pdf = '~/evince_synctex/evince'

" Fold frames (with beamer class)
let g:Tex_FoldedEnvironments = 'verbatim,comment,eq,gather,align,figure,table,thebibliography,keywords,abstract,titlepage,frame'
" Disable annoying IMAP macros (like SSS --> \section, {{ --> \left\{  \right\})
let g:Imap_FreezeImap=1
" Disable vim-latex placeholders
let g:Imap_UsePlaceHolders = 0
" Fold preamble, among other things
let g:Tex_FoldedMisc='slide,preamble,<<<'

let g:Tex_IgnoredWarnings =
\"Underfull\n".
\"Overfull\n".
\"specifier changed to\n".
\"You have requested\n".
\"Missing number, treated as zero.\n".
\"There were undefined references\n".
\"Marginpar on page %.%# moved." " We want to ignore this additionally. The other 7 entries before are the default. (Whatever the fuck %.%# means...)
let g:Tex_IgnoreLevel = 8 " default: 7

" Disable indentation for LaTeX files.
autocmd FileType tex setlocal indentexpr=

" Do not include cross referenced references if they are cross referenced more than once
"let g:Tex_BibtexFlavor='bibtex -min-crossrefs=9999'
"}}}
