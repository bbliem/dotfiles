" http://stackoverflow.com/questions/2407920/fold-c-preprocessor-in-vim
" This function customises what is displayed on the folded line:
set foldtext=MyFoldText()
function! MyFoldText()
    let line = getline(v:foldstart)
    let linecount = v:foldend + 1 - v:foldstart
    let plural = ""
    if linecount != 1
        let plural = "s"
    endif
    let foldtext = printf(" +%s %d line%s: %s", v:folddashes, linecount, plural, line)
    return foldtext
endfunction
" This is the line that works the magic
set foldmarker=#if,#endif
set foldmethod=marker
