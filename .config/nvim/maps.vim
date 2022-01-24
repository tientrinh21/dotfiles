" KEYMAPS

" Select all
nmap <C-a> gg<S-v>G
" Copy to clipboard
nnoremap <C-c> <S-v>:y+<Return>
vnoremap <C-c> :y+<Return> 
" Comment
noremap <C-_> :Commentary<Return>


"-----------------------------
" tabs
" open current directory
nmap tn :tabnew<return>
nmap tc :tabclose<return>
nmap te :tabedit<space>
nmap tt :tabnext<Return>
nmap TT :tabprev<Return>
nmap t<Tab> g<Tab>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-S-Left> 10<C-w><
nmap <C-S-Right> 10<C-w>>
nmap <C-S-Up> 5<C-w>+
nmap <C-S-Down> 5<C-w>-

"-----------------------------

nmap ff :FZF<Return> 
nmap fzf :FZF ~<Return>

"------------------------------
" Lspsaga

" LSP Finder
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" Rename
nnoremap <silent> gr <cmd>lua require('lspsaga.rename').rename()<CR>
" Preview Definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
"Code action
nnoremap <silent> ga <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent> ga :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" Hover Doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
"nnoremap <silent> <C-u> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
"nnoremap <silent> <C-d> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" Signature Help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
" Diagnostics
nnoremap <silent> gj :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> gk :Lspsaga diagnostic_jump_prev<CR>
