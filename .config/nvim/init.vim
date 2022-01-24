"My VIMRC

" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set number
syntax on
set nobackup
set ruler
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set splitright
set t_Co=256

if has('nvim')
  set inccommand=split
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab

filetype plugin indent on
set shiftwidth=2
set tabstop=2
set si "Smart indent
set nowrap "No Wrap lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "No auto comment next line
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste


"}}}

" Highlights "{{{
" ---------------------------------------------------------------------

set cursorline

"}}}

" File types "{{{
" ---------------------------------------------------------------------

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax on
  set termguicolors
  set winblend=0
  set pumblend=5
  if (has("autocmd") && !has("gui_running"))
    augroup colorset
      autocmd!
      let s:fg = { "gui": "#DDE2ED", "cterm": "145", "cterm16" : "7" }
      autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:fg }) " `bg` will not be styled since there is no `bg` setting
    augroup END
  endif

  colorscheme onedark
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------

set exrc
" vim: set foldmethod=marker foldlevel=0:

"}}}
