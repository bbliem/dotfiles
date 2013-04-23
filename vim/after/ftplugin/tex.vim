" See http://vim.wikia.com/wiki/Compiling_LaTeX_from_Vim
"au BufWritePost *.tex silent call Tex_RunLaTeX()

setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
  setlocal makeprg=make
endif
