hi Conceal guibg=NONE guifg=lightgreen
hi texBoldMathText cterm=bold gui=bold
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

syn match texMathSymbol '\\lor\>' contained conceal cchar=∨
syn match texMathSymbol '\\land\>' contained conceal cchar=∧
syn match texMathSymbol '\\lnot\>' contained conceal cchar=¬
syn match texMathSymbol '\\implies\>' contained conceal cchar=⇒
syn match texMathSymbol '\\geqslant\>' contained conceal cchar=⩾
syn match texMathSymbol '\\leqslant\>' contained conceal cchar=⩽

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

syn match texBoldMathText '\\tupA\>' contained conceal cchar=𝐀
syn match texBoldMathText '\\tupB\>' contained conceal cchar=𝐁
syn match texBoldMathText '\\tupC\>' contained conceal cchar=𝐂
syn match texBoldMathText '\\tupD\>' contained conceal cchar=𝐃
syn match texBoldMathText '\\tupE\>' contained conceal cchar=𝐄
syn match texBoldMathText '\\tupF\>' contained conceal cchar=𝐅
syn match texBoldMathText '\\tupG\>' contained conceal cchar=𝐆
syn match texBoldMathText '\\tupH\>' contained conceal cchar=𝐇
syn match texBoldMathText '\\tupI\>' contained conceal cchar=𝐈
syn match texBoldMathText '\\tupJ\>' contained conceal cchar=𝐉
syn match texBoldMathText '\\tupK\>' contained conceal cchar=𝐊
syn match texBoldMathText '\\tupL\>' contained conceal cchar=𝐋
syn match texBoldMathText '\\tupM\>' contained conceal cchar=𝐌
syn match texBoldMathText '\\tupN\>' contained conceal cchar=𝐍
syn match texBoldMathText '\\tupO\>' contained conceal cchar=𝐎
syn match texBoldMathText '\\tupP\>' contained conceal cchar=𝐏
syn match texBoldMathText '\\tupQ\>' contained conceal cchar=𝐐
syn match texBoldMathText '\\tupR\>' contained conceal cchar=𝐑
syn match texBoldMathText '\\tupS\>' contained conceal cchar=𝐒
syn match texBoldMathText '\\tupT\>' contained conceal cchar=𝐓
syn match texBoldMathText '\\tupU\>' contained conceal cchar=𝐔
syn match texBoldMathText '\\tupV\>' contained conceal cchar=𝐕
syn match texBoldMathText '\\tupW\>' contained conceal cchar=𝐖
syn match texBoldMathText '\\tupX\>' contained conceal cchar=𝐗
syn match texBoldMathText '\\tupY\>' contained conceal cchar=𝐘
syn match texBoldMathText '\\tupZ\>' contained conceal cchar=𝐙

syn match texBoldMathText '\\tupa\>' contained conceal cchar=𝐚
syn match texBoldMathText '\\tupb\>' contained conceal cchar=𝐛
syn match texBoldMathText '\\tupc\>' contained conceal cchar=𝐜
syn match texBoldMathText '\\tupd\>' contained conceal cchar=𝐝
syn match texBoldMathText '\\tupe\>' contained conceal cchar=𝐞
syn match texBoldMathText '\\tupf\>' contained conceal cchar=𝐟
syn match texBoldMathText '\\tupg\>' contained conceal cchar=𝐠
syn match texBoldMathText '\\tuph\>' contained conceal cchar=𝐡
syn match texBoldMathText '\\tupi\>' contained conceal cchar=𝐢
syn match texBoldMathText '\\tupj\>' contained conceal cchar=𝐣
syn match texBoldMathText '\\tupk\>' contained conceal cchar=𝐤
syn match texBoldMathText '\\tupl\>' contained conceal cchar=𝐥
syn match texBoldMathText '\\tupm\>' contained conceal cchar=𝐦
syn match texBoldMathText '\\tupn\>' contained conceal cchar=𝐧
syn match texBoldMathText '\\tupo\>' contained conceal cchar=𝐨
syn match texBoldMathText '\\tupp\>' contained conceal cchar=𝐩
syn match texBoldMathText '\\tupq\>' contained conceal cchar=𝐪
syn match texBoldMathText '\\tupr\>' contained conceal cchar=𝐫
syn match texBoldMathText '\\tups\>' contained conceal cchar=𝐬
syn match texBoldMathText '\\tupt\>' contained conceal cchar=𝐭
syn match texBoldMathText '\\tupu\>' contained conceal cchar=𝐮
syn match texBoldMathText '\\tupv\>' contained conceal cchar=𝐯
syn match texBoldMathText '\\tupw\>' contained conceal cchar=𝐰
syn match texBoldMathText '\\tupx\>' contained conceal cchar=𝐱
syn match texBoldMathText '\\tupy\>' contained conceal cchar=𝐲
syn match texBoldMathText '\\tupz\>' contained conceal cchar=𝐳
" syn match texBoldMathText '\\bar\>' contained conceal cchar=‾

syn match texBoldMathText '\\mathcal{A}\>' contained conceal cchar=𝐀
syn match texBoldMathText '\\mathcal{B}\>' contained conceal cchar=𝐁
syn match texBoldMathText '\\mathcal{C}\>' contained conceal cchar=𝐂
syn match texBoldMathText '\\mathcal{D}\>' contained conceal cchar=𝐃
syn match texBoldMathText '\\mathcal{E}\>' contained conceal cchar=𝐄
syn match texBoldMathText '\\mathcal{F}\>' contained conceal cchar=𝐅
syn match texBoldMathText '\\mathcal{G}\>' contained conceal cchar=𝐆
syn match texBoldMathText '\\mathcal{H}\>' contained conceal cchar=𝐇
syn match texBoldMathText '\\mathcal{I}\>' contained conceal cchar=𝐈
syn match texBoldMathText '\\mathcal{J}\>' contained conceal cchar=𝐉
syn match texBoldMathText '\\mathcal{K}\>' contained conceal cchar=𝐊
syn match texBoldMathText '\\mathcal{L}\>' contained conceal cchar=𝐋
syn match texBoldMathText '\\mathcal{M}\>' contained conceal cchar=𝐌
syn match texBoldMathText '\\mathcal{N}\>' contained conceal cchar=𝐍
syn match texBoldMathText '\\mathcal{O}\>' contained conceal cchar=𝐎
syn match texBoldMathText '\\mathcal{P}\>' contained conceal cchar=𝐏
syn match texBoldMathText '\\mathcal{Q}\>' contained conceal cchar=𝐐
syn match texBoldMathText '\\mathcal{R}\>' contained conceal cchar=𝐑
syn match texBoldMathText '\\mathcal{S}\>' contained conceal cchar=𝐒
syn match texBoldMathText '\\mathcal{T}\>' contained conceal cchar=𝐓
syn match texBoldMathText '\\mathcal{U}\>' contained conceal cchar=𝐔
syn match texBoldMathText '\\mathcal{V}\>' contained conceal cchar=𝐕
syn match texBoldMathText '\\mathcal{W}\>' contained conceal cchar=𝐖
syn match texBoldMathText '\\mathcal{X}\>' contained conceal cchar=𝐗
syn match texBoldMathText '\\mathcal{Y}\>' contained conceal cchar=𝐘
syn match texBoldMathText '\\mathcal{Z}\>' contained conceal cchar=𝐙

syn match texBoldMathText '\\calA\>' contained conceal cchar=𝐀
syn match texBoldMathText '\\calB\>' contained conceal cchar=𝐁
syn match texBoldMathText '\\calC\>' contained conceal cchar=𝐂
syn match texBoldMathText '\\calD\>' contained conceal cchar=𝐃
syn match texBoldMathText '\\calE\>' contained conceal cchar=𝐄
syn match texBoldMathText '\\calF\>' contained conceal cchar=𝐅
syn match texBoldMathText '\\calG\>' contained conceal cchar=𝐆
syn match texBoldMathText '\\calH\>' contained conceal cchar=𝐇
syn match texBoldMathText '\\calI\>' contained conceal cchar=𝐈
syn match texBoldMathText '\\calJ\>' contained conceal cchar=𝐉
syn match texBoldMathText '\\calK\>' contained conceal cchar=𝐊
syn match texBoldMathText '\\calL\>' contained conceal cchar=𝐋
syn match texBoldMathText '\\calM\>' contained conceal cchar=𝐌
syn match texBoldMathText '\\calN\>' contained conceal cchar=𝐍
syn match texBoldMathText '\\calO\>' contained conceal cchar=𝐎
syn match texBoldMathText '\\calP\>' contained conceal cchar=𝐏
syn match texBoldMathText '\\calQ\>' contained conceal cchar=𝐐
syn match texBoldMathText '\\calR\>' contained conceal cchar=𝐑
syn match texBoldMathText '\\calS\>' contained conceal cchar=𝐒
syn match texBoldMathText '\\calT\>' contained conceal cchar=𝐓
syn match texBoldMathText '\\calU\>' contained conceal cchar=𝐔
syn match texBoldMathText '\\calV\>' contained conceal cchar=𝐕
syn match texBoldMathText '\\calW\>' contained conceal cchar=𝐖
syn match texBoldMathText '\\calX\>' contained conceal cchar=𝐗
syn match texBoldMathText '\\calY\>' contained conceal cchar=𝐘
syn match texBoldMathText '\\calZ\>' contained conceal cchar=𝐙

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

hi texBoldMathText cterm=bold gui=bold
