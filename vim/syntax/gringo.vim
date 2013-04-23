syn match gringoPredicate /\<-\=\l\w*\>/ nextgroup=gringoArguments
hi link gringoPredicate Identifier

syn match gringoVariable /\<\u\w*\>\|\<_\>/ contained
hi link gringoVariable PreProc

syn match gringoConstant /\<\l\w*\>/ contained
hi link gringoConstant Constant

syn match gringoNumber /\<\d\+\>/ contained
hi link gringoNumber Constant

syn region gringoArguments start=/(/ end=/)/ contained contains=gringoVariable,gringoConstant,gringoNumber

syn match gringoComment /%.*$/ contains=gringoTodo
syn region gringoComment start=/%\*/ end=/\*%/ contains=gringoTodo
hi link gringoComment Comment

syn match gringoIf /:-/
hi link gringoIf Statement

syn match gringoOr /|/
hi link gringoOr Statement

syn keyword gringoNot not
hi link gringoNot Type

syn keyword gringoTodo contained TODO XXX FIXME
hi link gringoTodo Todo
