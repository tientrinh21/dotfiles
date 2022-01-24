" PLUGIN

call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"     Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
"     Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
"     Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
"     Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Using a non-default branch
"     Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"     Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
"     Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Fuzzy filer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Statusline
Plug 'vim-airline/vim-airline'
" Git + improve statusline
Plug 'tpope/vim-fugitive'
" One dark theme
Plug 'joshdick/onedark.vim'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0' }
" Auto pairs
Plug 'jiangmiao/auto-pairs'
"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Comment
Plug 'tpope/vim-commentary'
" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Configuration  

"Fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.5, 'yoffset': 2.0 } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"Airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = '  '
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = '☰'
let g:airline#extensions#tabline#enabled = 1
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
let w:airline_section_z = ''
let g:airline#extensions#fzf#enabled = 1
let g:airline_section_c_only_filename = 1


" AutoPairs
let g:AutoPairsFlyMode = 1

call plug#end()

