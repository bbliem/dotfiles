colorscheme molokai
let g:is_posix = 1 " Otherwise $(...) in bash scripts will be highlighted in an irritating way
filetype plugin indent on
let powerline_pycmd = "py3"

" Automatically open quickfix window after vimgrep
autocmd QuickFixCmdPost vimgrep cwindow

" Automatically open tagbar when loading a buffer with a supported file type
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"{{{ Syntax highlighting
if !exists("g:syntax_on")
    syntax enable
endif
syntax spell toplevel " http://stackoverflow.com/questions/5860154/vim-spell-checking-comments-only-in-latex-files
" Highlight spaces before EOL
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/

function! HighlightTrailingWhitespace()
  " If option 'fo' contains 'w', do not highlight trailing whitespace
  if &fo =~ 'w'
    :match
  else
    :match ExtraWhitespace /\s\+$/
  endif
endfunction
"}}}
"{{{ "set" commands for tab behavior
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
"}}}
"{{{ "set" commands for everything else
set autochdir
set background=dark
"set cindent
set cinoptions=g0 " No indent for public / protected / private
set completeopt=menuone,longest,preview
set cursorline
set foldmethod=marker
set gdefault
set ignorecase " Add \C to search pattern for case-sensitivity
set iskeyword+=/ " Don't pass over directories when pressing <C-W> in vim's command line
set hidden
set history=500 " Remember more commands
set hlsearch
set laststatus=2
set linebreak " Do not break in the middle of words
set matchpairs+=<:> " Match angled braces
set mouse=a
set mousemodel=popup_setpos " Makes, e.g., spell suggestions easily accessible
set nocompatible
set nojoinspaces
set noshowmode " powerline should take care of this
set scrolloff=5 " Always scroll as to leave a few lines visible above/below cursor
set showbreak=\ \ ↪\  " Show this before wrapped lines
set showcmd
set spell
set spelllang=en_us
"set switchbuf=usetab,newtab
set switchbuf=useopen
set tags=tags; " Semicolon makes sure ancestor directories are searched, http://vim.wikia.com/wiki/Single_tags_file_for_a_source_tree
set wildignore=*.o,*.class,*.swp,*.aux,*.pdf,*.dvi,*.ps,*.nav,*.snm,*.toc,*.vrb,*.tdo,*.bbl,*.blg,*-blx.bib,*.bcf,*.run.xml,*.auxlock,*.synctex.gz,*.fdb_latexmk,*.fls
set wildmenu
" showbreak should use the same background as normal text

" Save swap files in some separate directory
set directory=~/.vim-swapfiles
set backupdir=~/.vim-swapfiles
"}}}
"{{{ Key mappings
" Don't use Ex mode, use Q for :q!
"map Q ZQ
" Use space bar to toggle or create folds
nmap <silent> <Space> za
vmap <silent> <Space> zf
" Hide search highlighting (then clear and redraw screen) with CTRL-L
"nnoremap <silent> <C-L> :match none<CR>:noh<CR>:cclose<CR><C-L>
"nnoremap <silent> <C-L> :match ExtraWhitespace /\s\+$/<CR>:noh<CR>:cclose<CR><C-L>
nnoremap <silent> <C-L> :call HighlightTrailingWhitespace()<CR>:noh<CR>:cclose<CR><C-L>
" Disable F1 help
map <F1> <nop>
imap <F1> <nop>
" Save with F2
map <silent> <F2> :update<CR>
imap <silent> <F2> <C-O>:update<CR>
" Grep in CWD with F3
nmap <F3> :vimgrep //j *<left><left><left><left>

" Shortcuts for tab switching
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <C-S-tab> gT
nnoremap <C-tab> gt

" Delete buffer without closing window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Arrow keys affect *display* lines (for real lines, use j/k)
"map <Up> gk
"map <Down> gj
"map <Home> g<Home>
"map <End> g<End>
"imap <Up> <C-o>gk
"imap <Down> <C-o>gj
"imap <Home> <C-o>g<Home>
"imap <End> <C-o>g<End>

" Toggle Nerdtree with Shift + Space
nmap <S-Space> :execute 'NERDTreeToggle ' . fnameescape(getcwd())<CR>
" It seems to be a limitation of terminals that you can't map anything to
" Shift + Something, however it works in gvim.
" So we try to also map CTRL + Space to the same command. However, due to
" terminals misinterpreting this as CTRL + @, we use that one.
nmap <C-@> :execute 'NERDTreeToggle ' .   fnameescape(getcwd())<CR>
" Ignore certain file types
let NERDTreeIgnore = ['\v\.(acn|glo|idx|ist|loa|lof|log|lot|out|latexmain)$|^__pycache__$'] " very magic

" Make mouse clicks appear in the jump list so that, e.g., CTRL-O can be used
" to jump back to the position before clicking.
" http://vim.1045645.n5.nabble.com/Clicking-the-mouse-doesn-t-change-the-jump-list-td1201782.html
noremap <LeftMouse> m'<LeftMouse>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Toggle tagbar with F5
nnoremap <silent> <F5> :TagbarToggle<CR>

" Use [[ and ]] to move among functions even if { or } are not in the first
" column. Unfortunately deletes the last search.
"map [[ ?{<CR>w99[{
"map ][ /}<CR>b99]}
"map ]] j0[[%/{<CR>
"map [] k$][%?}<CR>

" Disable arrow movement, resize splits instead.
" Taken from https://coderoncode.com/tools/2017/04/16/vim-the-perfect-ide.html
"nnoremap <Up>    :resize +2<CR>
"nnoremap <Down>  :resize -2<CR>
"nnoremap <Left>  :vertical resize +2<CR>
"nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up>    <C-w>k
nnoremap <Down>  <C-w>j
nnoremap <Left>  <C-w>h
nnoremap <Right> <C-w>l

" Press <leader>m to compile
nnoremap <leader>m :silent make\|redraw!\|cc<CR>

"{{{ Settings for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"}}}
"{{{ Settings for vimplug
call plug#begin('~/.vim-plugins')
Plug 'davidhalter/jedi-vim'
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'dhruvasagar/vim-table-mode'
Plug 'tmhedberg/SimpylFold'
Plug 'tmhedberg/matchit'
Plug 'vim-scripts/indentpython.vim'
Plug 'vale1410/vim-minizinc'
call plug#end()
"}}}
"{{{ Settings for nerdcommenter
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
"}}}
"{{{ Settings for NERDTree
let NERDTreeMapActivateNode='<Space>'
" Single-click to open files/directories
let NERDTreeMouseMode=3
"}}}
