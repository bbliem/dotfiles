hi Conceal guibg=NONE guifg=lightgreen
"let g:tex_conceal="adgms"
"set cole=2
"hi Conceal guibg=gray20 guifg=navajowhite
"hi NonText guibg=gray20
"
"syn match texMathSymbol '\\supset\>' contained conceal cchar=⊃
"syn match texMathSymbol '\\land\>' contained conceal cchar=∧
"syn match texMathSymbol '\\lor\>' contained conceal cchar=∨
"syn match texMathSymbol '\\{' contained conceal cchar={
"syn match texMathSymbol '\\}' contained conceal cchar=}
"
"" no spell checking in listings
"syn region texZone      start="\\begin{verbatim}"           end="\\end{verbatim}\|%stopzone\>"  contains=@NoSpell
"syn region texZone      start="\\begin{code}"               end="\\end{code}\|%stopzone\>"  contains=@NoSpell
"" listings package:
"syn region texZone      start="\\begin{lstlisting}"         end="\\end{lstlisting}\|%stopzone\>"    contains=@NoSpell
"" moreverb package:
"syn region texZone      start="\\begin{verbatimtab}"        end="\\end{verbatimtab}\|%stopzone\>"   contains=@NoSpell
"syn region texZone      start="\\begin{verbatimwrite}"      end="\\end{verbatimwrite}\|%stopzone\>" contains=@NoSpell
"syn region texZone      start="\\begin{boxedverbatim}"      end="\\end{boxedverbatim}\|%stopzone\>" contains=@NoSpell
"
"" no spell checking in \todo
"syn region texZone      start="\\todo{"      end="\}\|%stopzone\>" contains=@NoSpell
"syn region texZone      start="\\todo\[inline\]{"      end="\}\|%stopzone\>" contains=@NoSpell
"syntax spell toplevel
"set spell
"
"" if you write your \label's as \label{fig:something}, then if you
"" type in \ref{fig: and press Ctrl-N you will automatically cycle through
"" all the figure labels. (Also remember F9.)
"set iskeyword+=:
"set iskeyword+=-
"set iskeyword-=_


" The following are based on the tex-conceal plugin for vim

" more reasonably sized symbols that were already defined
syn match texMathSymbol '\\Rightarrow\>' contained conceal cchar=⇒
syn match texMathSymbol '\\Leftarrow\>' contained conceal cchar=⇐
syn match texMathSymbol '\\rightarrow\>' contained conceal cchar=→
syn match texMathSymbol '\\leftarrow\>' contained conceal cchar=←
syn match texMathSymbol '\\emptyset\>' contained conceal cchar=Ø
syn match texMathSymbol '\\varphi\>' contained conceal cchar=φ
syn match texMathSymbol '\\phi\>' contained conceal cchar=Φ
syn match texMathSymbol '\\langle\>\s*' contained conceal cchar=⟨
syn match texMathSymbol '\s*\\rangle\>' contained conceal cchar=⟩
syn match texMathSymbol '\\\\' contained conceal cchar=⏎

" Simple number super/sub-scripts
syn match texMathSymbol '\^0' contained conceal cchar=⁰
syn match texMathSymbol '\^1' contained conceal cchar=¹
syn match texMathSymbol '\^2' contained conceal cchar=²
syn match texMathSymbol '\^3' contained conceal cchar=³
syn match texMathSymbol '\^4' contained conceal cchar=⁴
syn match texMathSymbol '\^5' contained conceal cchar=⁵
syn match texMathSymbol '\^6' contained conceal cchar=⁶
syn match texMathSymbol '\^7' contained conceal cchar=⁷
syn match texMathSymbol '\^8' contained conceal cchar=⁸
syn match texMathSymbol '\^9' contained conceal cchar=⁹

syn match texMathSymbol '\^{-1}' contained conceal contains=texSuperscripts
syn match texMathSymbol '\^\\mathrm{T}' contained conceal contains=texSuperscripts
syn match texMathSymbol '\^\\mathrm{-T}' contained conceal contains=texSuperscripts
syn match texSuperscripts '1' contained conceal cchar=¹
syn match texSuperscripts '-' contained conceal cchar=⁻
syn match texSuperscripts 'T' contained conceal cchar=ᵀ

syn match texMathSymbol '_0' contained conceal cchar=₀
syn match texMathSymbol '_1' contained conceal cchar=₁
syn match texMathSymbol '_2' contained conceal cchar=₂
syn match texMathSymbol '_3' contained conceal cchar=₃
syn match texMathSymbol '_4' contained conceal cchar=₄
syn match texMathSymbol '_5' contained conceal cchar=₅
syn match texMathSymbol '_6' contained conceal cchar=₆
syn match texMathSymbol '_7' contained conceal cchar=₇
syn match texMathSymbol '_8' contained conceal cchar=₈
syn match texMathSymbol '_9' contained conceal cchar=₉
syn match texMathSymbol '_i' contained conceal cchar=ᵢ
syn match texMathSymbol '^i' contained conceal cchar=ⁱ
syn match texMathSymbol '_o' contained conceal cchar=ₒ
syn match texMathSymbol '^o' contained conceal cchar=ᵒ

" logical symbols
syn match texMathSymbol '\\lor\>' contained conceal cchar=∨
syn match texMathSymbol '\\land\>' contained conceal cchar=∧
syn match texMathSymbol '\\lnot\>' contained conceal cchar=¬
syn match texMathSymbol '\\implies\>' contained conceal cchar=⇒
syn match texMathSymbol '\\geqslant\>' contained conceal cchar=⩾
syn match texMathSymbol '\\leqslant\>' contained conceal cchar=⩽

" \mathbb characters
syn match texMathSymbol '\\mathbb{A}' contained conceal cchar=𝔸
syn match texMathSymbol '\\mathbb{B}' contained conceal cchar=𝔹
syn match texMathSymbol '\\mathbb{C}' contained conceal cchar=ℂ
syn match texMathSymbol '\\mathbb{D}' contained conceal cchar=𝔻
syn match texMathSymbol '\\mathbb{E}' contained conceal cchar=𝔼
syn match texMathSymbol '\\mathbb{F}' contained conceal cchar=𝔽
syn match texMathSymbol '\\mathbb{G}' contained conceal cchar=𝔾
syn match texMathSymbol '\\mathbb{H}' contained conceal cchar=ℍ
syn match texMathSymbol '\\mathbb{I}' contained conceal cchar=𝕀
syn match texMathSymbol '\\mathbb{J}' contained conceal cchar=𝕁
syn match texMathSymbol '\\mathbb{K}' contained conceal cchar=𝕂
syn match texMathSymbol '\\mathbb{L}' contained conceal cchar=𝕃
syn match texMathSymbol '\\mathbb{M}' contained conceal cchar=𝕄
syn match texMathSymbol '\\mathbb{N}' contained conceal cchar=ℕ
syn match texMathSymbol '\\mathbb{O}' contained conceal cchar=𝕆
syn match texMathSymbol '\\mathbb{P}' contained conceal cchar=ℙ
syn match texMathSymbol '\\mathbb{Q}' contained conceal cchar=ℚ
syn match texMathSymbol '\\mathbb{R}' contained conceal cchar=ℝ
syn match texMathSymbol '\\mathbb{S}' contained conceal cchar=𝕊
syn match texMathSymbol '\\mathbb{T}' contained conceal cchar=𝕋
syn match texMathSymbol '\\mathbb{U}' contained conceal cchar=𝕌
syn match texMathSymbol '\\mathbb{V}' contained conceal cchar=𝕍
syn match texMathSymbol '\\mathbb{W}' contained conceal cchar=𝕎
syn match texMathSymbol '\\mathbb{X}' contained conceal cchar=𝕏
syn match texMathSymbol '\\mathbb{Y}' contained conceal cchar=𝕐
syn match texMathSymbol '\\mathbb{Z}' contained conceal cchar=ℤ

syn match texBoldMathText '\\tupA\>' contained conceal cchar=A
syn match texBoldMathText '\\tupB\>' contained conceal cchar=B
syn match texBoldMathText '\\tupC\>' contained conceal cchar=C
syn match texBoldMathText '\\tupD\>' contained conceal cchar=D
syn match texBoldMathText '\\tupE\>' contained conceal cchar=E
syn match texBoldMathText '\\tupF\>' contained conceal cchar=F
syn match texBoldMathText '\\tupG\>' contained conceal cchar=G
syn match texBoldMathText '\\tupH\>' contained conceal cchar=H
syn match texBoldMathText '\\tupI\>' contained conceal cchar=I
syn match texBoldMathText '\\tupJ\>' contained conceal cchar=J
syn match texBoldMathText '\\tupK\>' contained conceal cchar=K
syn match texBoldMathText '\\tupL\>' contained conceal cchar=L
syn match texBoldMathText '\\tupM\>' contained conceal cchar=M
syn match texBoldMathText '\\tupN\>' contained conceal cchar=N
syn match texBoldMathText '\\tupO\>' contained conceal cchar=O
syn match texBoldMathText '\\tupP\>' contained conceal cchar=P
syn match texBoldMathText '\\tupQ\>' contained conceal cchar=Q
syn match texBoldMathText '\\tupR\>' contained conceal cchar=R
syn match texBoldMathText '\\tupS\>' contained conceal cchar=S
syn match texBoldMathText '\\tupT\>' contained conceal cchar=T
syn match texBoldMathText '\\tupU\>' contained conceal cchar=U
syn match texBoldMathText '\\tupV\>' contained conceal cchar=V
syn match texBoldMathText '\\tupW\>' contained conceal cchar=W
syn match texBoldMathText '\\tupX\>' contained conceal cchar=X
syn match texBoldMathText '\\tupY\>' contained conceal cchar=Y
syn match texBoldMathText '\\tupZ\>' contained conceal cchar=Z

syn match texBoldMathText '\\tupa\>' contained conceal cchar=a
syn match texBoldMathText '\\tupb\>' contained conceal cchar=b
syn match texBoldMathText '\\tupc\>' contained conceal cchar=c
syn match texBoldMathText '\\tupd\>' contained conceal cchar=d
syn match texBoldMathText '\\tupe\>' contained conceal cchar=e
syn match texBoldMathText '\\tupf\>' contained conceal cchar=f
syn match texBoldMathText '\\tupg\>' contained conceal cchar=g
syn match texBoldMathText '\\tuph\>' contained conceal cchar=h
syn match texBoldMathText '\\tupi\>' contained conceal cchar=i
syn match texBoldMathText '\\tupj\>' contained conceal cchar=j
syn match texBoldMathText '\\tupk\>' contained conceal cchar=k
syn match texBoldMathText '\\tupl\>' contained conceal cchar=l
syn match texBoldMathText '\\tupm\>' contained conceal cchar=m
syn match texBoldMathText '\\tupn\>' contained conceal cchar=n
syn match texBoldMathText '\\tupo\>' contained conceal cchar=o
syn match texBoldMathText '\\tupp\>' contained conceal cchar=p
syn match texBoldMathText '\\tupq\>' contained conceal cchar=q
syn match texBoldMathText '\\tupr\>' contained conceal cchar=r
syn match texBoldMathText '\\tups\>' contained conceal cchar=s
syn match texBoldMathText '\\tupt\>' contained conceal cchar=t
syn match texBoldMathText '\\tupu\>' contained conceal cchar=u
syn match texBoldMathText '\\tupv\>' contained conceal cchar=v
syn match texBoldMathText '\\tupw\>' contained conceal cchar=w
syn match texBoldMathText '\\tupx\>' contained conceal cchar=x
syn match texBoldMathText '\\tupy\>' contained conceal cchar=y
syn match texBoldMathText '\\tupz\>' contained conceal cchar=z
" syn match texBoldMathText '\\bar\>' contained conceal cchar=‾

" \mathcal characters
syn match texMathSymbol '\\mathcal{A}' contained conceal cchar=𝓐
syn match texMathSymbol '\\mathcal{B}' contained conceal cchar=𝓑
syn match texMathSymbol '\\mathcal{C}' contained conceal cchar=𝓒
syn match texMathSymbol '\\mathcal{D}' contained conceal cchar=𝓓
syn match texMathSymbol '\\mathcal{E}' contained conceal cchar=𝓔
syn match texMathSymbol '\\mathcal{F}' contained conceal cchar=𝓕
syn match texMathSymbol '\\mathcal{G}' contained conceal cchar=𝓖
syn match texMathSymbol '\\mathcal{H}' contained conceal cchar=𝓗
syn match texMathSymbol '\\mathcal{I}' contained conceal cchar=𝓘
syn match texMathSymbol '\\mathcal{J}' contained conceal cchar=𝓙
syn match texMathSymbol '\\mathcal{K}' contained conceal cchar=𝓚
syn match texMathSymbol '\\mathcal{L}' contained conceal cchar=𝓛
syn match texMathSymbol '\\mathcal{M}' contained conceal cchar=𝓜
syn match texMathSymbol '\\mathcal{N}' contained conceal cchar=𝓝
syn match texMathSymbol '\\mathcal{O}' contained conceal cchar=𝓞
syn match texMathSymbol '\\mathcal{P}' contained conceal cchar=𝓟
syn match texMathSymbol '\\mathcal{Q}' contained conceal cchar=𝓠
syn match texMathSymbol '\\mathcal{R}' contained conceal cchar=𝓡
syn match texMathSymbol '\\mathcal{S}' contained conceal cchar=𝓢
syn match texMathSymbol '\\mathcal{T}' contained conceal cchar=𝓣
syn match texMathSymbol '\\mathcal{U}' contained conceal cchar=𝓤
syn match texMathSymbol '\\mathcal{V}' contained conceal cchar=𝓥
syn match texMathSymbol '\\mathcal{W}' contained conceal cchar=𝓦
syn match texMathSymbol '\\mathcal{X}' contained conceal cchar=𝓧
syn match texMathSymbol '\\mathcal{Y}' contained conceal cchar=𝓨
syn match texMathSymbol '\\mathcal{Z}' contained conceal cchar=𝓩

syn match texMathSymbol '\\calA' contained conceal cchar=𝓐
syn match texMathSymbol '\\calB' contained conceal cchar=𝓑
syn match texMathSymbol '\\calC' contained conceal cchar=𝓒
syn match texMathSymbol '\\calD' contained conceal cchar=𝓓
syn match texMathSymbol '\\calE' contained conceal cchar=𝓔
syn match texMathSymbol '\\calF' contained conceal cchar=𝓕
syn match texMathSymbol '\\calG' contained conceal cchar=𝓖
syn match texMathSymbol '\\calH' contained conceal cchar=𝓗
syn match texMathSymbol '\\calI' contained conceal cchar=𝓘
syn match texMathSymbol '\\calJ' contained conceal cchar=𝓙
syn match texMathSymbol '\\calK' contained conceal cchar=𝓚
syn match texMathSymbol '\\calL' contained conceal cchar=𝓛
syn match texMathSymbol '\\calM' contained conceal cchar=𝓜
syn match texMathSymbol '\\calN' contained conceal cchar=𝓝
syn match texMathSymbol '\\calO' contained conceal cchar=𝓞
syn match texMathSymbol '\\calP' contained conceal cchar=𝓟
syn match texMathSymbol '\\calQ' contained conceal cchar=𝓠
syn match texMathSymbol '\\calR' contained conceal cchar=𝓡
syn match texMathSymbol '\\calS' contained conceal cchar=𝓢
syn match texMathSymbol '\\calT' contained conceal cchar=𝓣
syn match texMathSymbol '\\calU' contained conceal cchar=𝓤
syn match texMathSymbol '\\calV' contained conceal cchar=𝓥
syn match texMathSymbol '\\calW' contained conceal cchar=𝓦
syn match texMathSymbol '\\calX' contained conceal cchar=𝓧
syn match texMathSymbol '\\calY' contained conceal cchar=𝓨
syn match texMathSymbol '\\calZ' contained conceal cchar=𝓩

" Tuples
syn match texMathSymbol '\\calA' contained conceal cchar=𝓐
syn match texMathSymbol '\\calB' contained conceal cchar=𝓑
syn match texMathSymbol '\\calC' contained conceal cchar=𝓒
syn match texMathSymbol '\\calD' contained conceal cchar=𝓓
syn match texMathSymbol '\\calE' contained conceal cchar=𝓔
syn match texMathSymbol '\\calF' contained conceal cchar=𝓕
syn match texMathSymbol '\\calG' contained conceal cchar=𝓖
syn match texMathSymbol '\\calH' contained conceal cchar=𝓗
syn match texMathSymbol '\\calI' contained conceal cchar=𝓘
syn match texMathSymbol '\\calJ' contained conceal cchar=𝓙
syn match texMathSymbol '\\calK' contained conceal cchar=𝓚
syn match texMathSymbol '\\calL' contained conceal cchar=𝓛
syn match texMathSymbol '\\calM' contained conceal cchar=𝓜
syn match texMathSymbol '\\calN' contained conceal cchar=𝓝
syn match texMathSymbol '\\calO' contained conceal cchar=𝓞
syn match texMathSymbol '\\calP' contained conceal cchar=𝓟
syn match texMathSymbol '\\calQ' contained conceal cchar=𝓠
syn match texMathSymbol '\\calR' contained conceal cchar=𝓡
syn match texMathSymbol '\\calS' contained conceal cchar=𝓢
syn match texMathSymbol '\\calT' contained conceal cchar=𝓣
syn match texMathSymbol '\\calU' contained conceal cchar=𝓤
syn match texMathSymbol '\\calV' contained conceal cchar=𝓥
syn match texMathSymbol '\\calW' contained conceal cchar=𝓦
syn match texMathSymbol '\\calX' contained conceal cchar=𝓧
syn match texMathSymbol '\\calY' contained conceal cchar=𝓨
syn match texMathSymbol '\\calZ' contained conceal cchar=𝓩

syn match texStatement '``' contained conceal cchar=“
syn match texStatement '\'\'' contained conceal cchar=”
syn match texStatement '\\item\>' contained conceal cchar=•
syn match texMathSymbol '\\dd' contained conceal cchar=d
syn match texDelimiter '\\{' contained conceal cchar={
syn match texDelimiter '\\}' contained conceal cchar=}
syn match texMathSymbol '\\setminus\>' contained conceal cchar=\
syn match texMathSymbol '\\coloneqq\>' contained conceal cchar=≔
syn match texMathSymbol '\\,' contained conceal cchar= 
syn match texMathSymbol '\\ ' contained conceal cchar= 
syn match texMathSymbol '\\quad' contained conceal cchar= 
syn match texMathSymbol '\\sqrt' contained conceal cchar=√
syn match texMathSymbol '\\where\>' contained conceal cchar=|
syn match texMathSymbol '\\\!' contained conceal
"syn match texStatement '\\\[' contained conceal cchar=⟦
"syn match texStatement '\\\]' contained conceal cchar=⟧

" hide \text delimiter etc inside math mode
if !exists("g:tex_nospell") || !g:tex_nospell
  syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\=mathrm\)\s*{'     end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
  syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\=text\|mbox\)\s*{' end='}' concealends keepend contains=@texFoldGroup,@Spell containedin=texMathMatcher
else
  syn region texMathText matchgroup=texStatement start='\\\(\(inter\)\=text\|mbox\|mathrm\)\s*{' end='}' concealends keepend contains=@texFoldGroup containedin=texMathMatcher
endif

syn region texBoldMathText matchgroup=texStatement start='\\\(mathbf\|bm\|symbf\){' end='}' concealends contains=@texMathZoneGroup containedin=texMathMatcher
syn cluster texMathZoneGroup add=texBoldMathText

syn region texBoldItalStyle     matchgroup=texTypeStyle start="\\emph\s*{" end="}" concealends contains=@texItalGroup
syn region texItalStyle  matchgroup=texTypeStyle start="\\emph\s*{" end="}" concealends contains=@texItalGroup

set ambiwidth=single
hi texBoldMathText cterm=bold gui=bold
