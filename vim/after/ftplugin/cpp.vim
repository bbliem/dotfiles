" Switch between .h and .cpp with F8
" See http://vim.wikia.com/wiki/Easily_switch_between_source_and_header_file
" Using :drop so when both are open the cursor just jumps to the other window
map <F8> :drop %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" Split-open header if .cpp is open and vice versa with F9
map <F9> :spl %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
