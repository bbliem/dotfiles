if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

setlocal indentexpr=GetGringoIndent()
setlocal indentkeys-=:,0#
setlocal indentkeys+=0%,-,0;,>,0)
setlocal indentkeys+=0=end,0=until

" copied/modified lua.vim
function! GetGringoLuaIndent()
	let prevlnum = prevnonblank(v:lnum - 1)

	if prevlnum == 0
		return 0
	endif

	let ind = indent(prevlnum)
	let prevline = getline(prevlnum)
	let midx = match(prevline, '^\s*\%(if\>\|for\>\|while\>\|repeat\>\|else\>\|elseif\>\|do\>\|then\>\)')
	if midx == -1
		let midx = match(prevline, '{\s*$')
		if midx == -1
			let midx = match(prevline, '\<function\>\s*\%(\k\|[.:]\)\{-}\s*(')
		endif
	endif

	if midx != -1
		if synIDattr(synID(prevlnum, midx + 1, 1), "name") != "luaComment" && prevline !~ '\<end\>\|\<until\>'
			let ind = ind + &shiftwidth
		endif
	endif

	let midx = match(getline(v:lnum), '^\s*\%(end\|else\|until\|}\)')
	if midx != -1 && synIDattr(synID(v:lnum, midx + 1, 1), "name") != "luaComment"
		let ind = ind - &shiftwidth
	endif

	return ind
endfunction

" copied/modified prolog.vim
function! GetGringoIndent()
	if synIDattr(synstack(line("."), col("."))[0], "name") == "luaCode"
		return GetGringoLuaIndent()
	endif
    let pnum = prevnonblank(v:lnum - 1)
    if pnum == 0
       return 0
    endif
    let line = getline(v:lnum)
    let pline = getline(pnum)

    let ind = indent(pnum)
    if pline =~ '^\s*%'
		retu ind
    endif
    if pline =~ ':-\s*\(%.*\)\?$'
		let ind = ind + &sw
    elseif pline =~ '\.\s*\(%.*\)\?$'
		let ind = ind - &sw
    endif
    return ind
endfunction

