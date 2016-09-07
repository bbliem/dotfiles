colorscheme molokai
let g:tex_comment_nospell=1 " No spell check in comments
let g:is_posix = 1 " Otherwise $(...) in bash scripts will be highlighted in an irritating way

"{{{ Syntax highlighting
syntax on
syntax spell toplevel " http://stackoverflow.com/questions/5860154/vim-spell-checking-comments-only-in-latex-files
" Highlight spaces before EOL
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
"}}}
"{{{ "set" commands
set nocompatible
set mouse=a
set tabstop=4
set shiftwidth=4
set cinoptions=g0 " No indent for public / protected / private
"set cindent
filetype plugin indent on
set foldmethod=marker
set showcmd
set wildmenu
set hlsearch
set wildignore=*.o,*.class,*.swp,*.aux,*.pdf,*.dvi,*.ps,*.nav,*.snm,*.toc,*.vrb,*.tdo,*.bbl,*.blg,*-blx.bib,*.bcf,*.run.xml,*.auxlock,*.synctex.gz
set linebreak " Do not break in the middle of words
set showbreak=\ \ ↪\  " Show this before wrapped lines
" showbreak should use the same background as normal text
set scrolloff=3 " Always scroll as to leave a few lines visible above/below cursor
set history=200 " Remember more commands
set spelllang=en_us
"set spell
set autochdir
set matchpairs+=<:> " Match angled braces
set mousemodel=popup_setpos " Makes, e.g., spell suggestions easily accessible
set cursorline
set background=dark
set laststatus=2
set noshowmode " powerline should take care of this
set switchbuf=usetab,newtab

" Save swap files in some separate directory
set directory=~/.vim-swapfiles
set backupdir=~/.vim-swapfiles
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
" Hide search highlighting (then clear and redraw screen) with CTRL-L
"nnoremap <silent> <C-L> :match none<CR>:noh<CR>:cclose<CR><C-L>
nnoremap <silent> <C-L> :match ExtraWhitespace /\s\+$/<CR>:noh<CR>:cclose<CR><C-L>
" Disable F1 help
map <F1> <nop>
imap <F1> <nop>
" Save with F2
map <silent> <F2> :update<CR>
imap <silent> <F2> <C-O>:update<CR>

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
nmap <C-S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
imap <C-S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i

" Arrow keys affect *display* lines (for real lines, use j/k)
map <Up> gk
map <Down> gj
map <Home> g<Home>
map <End> g<End>
imap <Up> <C-o>gk
imap <Down> <C-o>gj
imap <Home> <C-o>g<Home>
imap <End> <C-o>g<End>

" Toggle Nerdtree with Shift + Space
nmap <S-Space> :execute 'NERDTreeToggle ' . getcwd()<CR>
" It seems to be a limitation of terminals that you can't map anything to
" Shift + Something, however it works in gvim.
" So we try to also map CTRL + Space to the same command. However, due to
" terminals misinterpreting this as CTRL + @, we use that one.
nmap <C-@> :execute 'NERDTreeToggle ' .   getcwd()<CR>

" Make mouse clicks appear in the jump list so that, e.g., CTRL-O can be used
" to jump back to the position before clicking.
" http://vim.1045645.n5.nabble.com/Clicking-the-mouse-doesn-t-change-the-jump-list-td1201782.html
noremap <LeftMouse> m'<LeftMouse>
"}}}
"{{{ Settings for vim-latexsuite
"let g:tex_indent_items = 0
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex' " Use LaTeX for all files with .tex extension
let g:Tex_DefaultTargetFormat='pdf'
"let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_MultipleCompileFormats='pdf'
"let g:Tex_CompileRule_pdf='pdflatex -file-line-error -interaction=nonstopmode $* > /dev/null'
" -shell-escape is for externalizing graphics with TikZ (see http://tex.stackexchange.com/questions/1460/script-to-automate-externalizing-tikz-graphics or the TikZ manual)
" let g:Tex_CompileRule_pdf='pdflatex -shell-escape -file-line-error -interaction=nonstopmode $* > /dev/null'
"let g:Tex_CompileRule_pdf='pdflatex -shell-escape -synctex=1 -file-line-error -interaction=nonstopmode $* > /dev/null'
let g:Tex_CompileRule_pdf='latexmk -pdf -pdflatex="pdflatex -synctex=1 -file-line-error -interaction=nonstopmode -shell-escape" -f $*'
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

" Don't jump to error locations (it's wrong most of the time and annoying)
let g:Tex_GotoError=0
" Don't show that domn log window each time
let g:Tex_ShowErrorContext=0

" Disable indentation for LaTeX files.
autocmd FileType tex setlocal indentexpr=

" Do not include cross referenced references if they are cross referenced more than once
"let g:Tex_BibtexFlavor='bibtex -min-crossrefs=9999'
"}}}
"{{{ Settings for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1
"}}}
