" View with F4
map <buffer> <F4> <localleader>lv
imap <buffer> <F4> <C-O><localleader>lv

setlocal foldmarker=<<<,>>>

setlocal iskeyword+=:
setlocal iskeyword+=-
setlocal iskeyword-=_

let g:tex_flavor='latex' " Use LaTeX for all files with .tex extension

setlocal conceallevel=2
let g:tex_conceal='abdmgs'

let g:vimtex_fold_preamble=1
" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'default' : 0,
      \  },
      \}

"let g:vimtex_view_general_viewer='/home/bernhard/evince_synctex/evince'
"let g:vimtex_view_general_viewer='/home/bernhard/evince_synctex/evince_forward_search'
"let g:vimtex_view_general_options='@pdf @line @tex'
"let g:vimtex_compiler_callback_hooks = ['EvinceForwardSearch']
"function! EvinceForwardSearch(status)
"  if !a:status | return | endif
"
"  let l:out = b:vimtex.out()
"  let l:tex = expand('%:p')
"  let l:cmd = ['/home/bernhard/evince_synctex/evince_forward_search']
"  if has('job')
"    call job_start(l:cmd + [l:out, line('.'), l:tex])
"  else
"    call system(join(l:cmd + [shellescape(l:out), line('.'), shellescape(l:tex)], ' '))
"  endif
"endfunction

let g:vimtex_view_method='zathura'
let g:vimtex_view_use_temp_files=1
