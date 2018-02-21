colorscheme molokai
let g:is_posix = 1 " Otherwise $(...) in bash scripts will be highlighted in an irritating way
filetype plugin indent on
let powerline_pycmd = "py3"

" Automatically open quickfix window after vimgrep
autocmd QuickFixCmdPost vimgrep cwindow

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
set cursorline
set foldmethod=marker
set gdefault
set ignorecase " Add \C to search pattern for case-sensitivity
set history=200 " Remember more commands
set hlsearch
set laststatus=2
set linebreak " Do not break in the middle of words
set matchpairs+=<:> " Match angled braces
set mouse=a
set mousemodel=popup_setpos " Makes, e.g., spell suggestions easily accessible
set nocompatible
set nojoinspaces
set noshowmode " powerline should take care of this
set scrolloff=3 " Always scroll as to leave a few lines visible above/below cursor
set showbreak=\ \ ↪\  " Show this before wrapped lines
set showcmd
set spell
set spelllang=en_us
set switchbuf=usetab,newtab
set wildignore=*.o,*.class,*.swp,*.aux,*.pdf,*.dvi,*.ps,*.nav,*.snm,*.toc,*.vrb,*.tdo,*.bbl,*.blg,*-blx.bib,*.bcf,*.run.xml,*.auxlock,*.synctex.gz,*.fdb_latexmk,*.fls
set wildmenu
" showbreak should use the same background as normal text

" Save swap files in some separate directory
set directory=~/.vim-swapfiles
set backupdir=~/.vim-swapfiles
"}}}
"{{{ Key mappings
" Don't use Ex mode, use Q for :q!
map Q ZQ
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
" Ignore certain file types
let NERDTreeIgnore = ['\v\.(acn|glo|idx|ist|loa|lof|log|lot|out|latexmain)$'] " very magic

" Make mouse clicks appear in the jump list so that, e.g., CTRL-O can be used
" to jump back to the position before clicking.
" http://vim.1045645.n5.nabble.com/Clicking-the-mouse-doesn-t-change-the-jump-list-td1201782.html
noremap <LeftMouse> m'<LeftMouse>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
"{{{ Settings for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1
"}}}
"{{{ Settings for vimplug
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
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
