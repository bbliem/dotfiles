syn match texMathSymbol '\\supset\>' contained conceal cchar=⊃
syn match texMathSymbol '\\land\>' contained conceal cchar=∧
syn match texMathSymbol '\\lor\>' contained conceal cchar=∨
syn match texMathSymbol '\\{' contained conceal cchar={
syn match texMathSymbol '\\}' contained conceal cchar=}

" no spell checking in listings
syn region texZone      start="\\begin{verbatim}"           end="\\end{verbatim}\|%stopzone\>"  contains=@NoSpell
syn region texZone      start="\\begin{code}"               end="\\end{code}\|%stopzone\>"  contains=@NoSpell
" listings package:
syn region texZone      start="\\begin{lstlisting}"         end="\\end{lstlisting}\|%stopzone\>"    contains=@NoSpell
" moreverb package:
syn region texZone      start="\\begin{verbatimtab}"        end="\\end{verbatimtab}\|%stopzone\>"   contains=@NoSpell
syn region texZone      start="\\begin{verbatimwrite}"      end="\\end{verbatimwrite}\|%stopzone\>" contains=@NoSpell
syn region texZone      start="\\begin{boxedverbatim}"      end="\\end{boxedverbatim}\|%stopzone\>" contains=@NoSpell

" no spell checking in \todo
syn region texZone      start="\\todo{"      end="\}\|%stopzone\>" contains=@NoSpell
syn region texZone      start="\\todo\[inline\]{"      end="\}\|%stopzone\>" contains=@NoSpell
syntax spell toplevel
set spell

" if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press Ctrl-N you will automatically cycle through
" all the figure labels. (Also remember F9.)
set iskeyword+=:
set iskeyword+=-
set iskeyword-=_
