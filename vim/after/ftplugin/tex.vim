map <F1> <nop>
" Compile with F3
map <F3> :update<CR><leader>ll
imap <F3> <C-O>:update<CR><C-O><leader>ll
" View with F4
map <F4> <leader>lv
imap <F4> <C-O><leader>lv

" See http://vim.wikia.com/wiki/Compiling_LaTeX_from_Vim
"au BufWritePost *.tex silent call Tex_RunLaTeX()

setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
  setlocal makeprg=make
endif

" http://blog.wuzzeb.org/posts/2013-05-11-vim-latex-forward-search.html
"function! SyncTex()
"	let filename = bufname("%")
"	let lineno = line(".")
"	for syncfile in split(system('zgrep -l "' . filename . '" *.synctex.gz'), "\n")
"		let pdffile = substitute(syncfile, ".synctex.gz$", ".pdf", "")
"		exec 'silent ! python2 ~/evince_synctex/evince_forward_search ' .
"			\ '"' . pdffile . '" ' . lineno . ' "' . filename . '"'
"	endfor
"endfunction
"map <buffer> <LocalLeader>e :call SyncTex()<CR>

" Use \ls to forward-search
function! Tex_ForwardSearchLaTeX()
"	let cmd = '~/evince_synctex/evince_forward_search ' . fnamemodify(Tex_GetMainFileName(), ":p:r") . '.pdf ' . line(".") . ' ' . expand("%:p")
	let cmd = '~/evince_synctex/evince_forward_search ' . fnamemodify(Tex_GetMainFileName(), ":p:h") . '/out/' . fnamemodify(Tex_GetMainFileName(), ":t:r") . '.pdf ' . line(".") . ' ' . expand("%:p")
	let output = system(cmd)
endfunction

" vim-latex can fold the preamble, but after opening a file, the cursor is
" placed there, which opens the fold. So here we close it explicitly.
call MakeTexFolds(1)
silent! foldclose
