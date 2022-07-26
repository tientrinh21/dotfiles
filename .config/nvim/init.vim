"******************************************************************************
" Vim-Plug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
	let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
	let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
	if !executable(curl_exists)
		echoerr "You have to install curl or first install vim-plug yourself!"
		execute "q!"
	endif
	echo "Installing Vim-Plug..."
	echo ""
	silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	let g:not_finish_vimplug = "yes"

	autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
" Plug install packages
"*****************************************************************************
" File explorer
if isdirectory('/usr/local/opt/fzf')
	Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
	Plug 'junegunn/fzf.vim'
endif
Plug 'kyazdani42/nvim-tree.lua'
Plug 'liuchengxu/vista.vim'

" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --prod',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Autocomplete
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" Git tools
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'airblade/vim-gitgutter'

" Utils
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'voldikss/vim-floaterm'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'justinmk/vim-sneak'

"" Custom icons
Plug 'kyazdani42/nvim-web-devicons'

" StartupTime
Plug 'dstein64/vim-startuptime'

" Themes
Plug 'nvim-lualine/lualine.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }

"*****************************************************************************
" Custom bundles
"*****************************************************************************
" lua
" Plug 'xolox/vim-lua-ftplugin'
" Plug 'xolox/vim-lua-inspect'

" python
" Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" html
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
" Plug 'tpope/vim-haml'

" javascript
Plug 'pangloss/vim-javascript'
" Plug 'MaxMEllon/vim-jsx-pretty'

" typescript
Plug 'leafgarland/typescript-vim'
" Plug 'HerringtonDarkholme/yats.vim' " Alternative one

" vuejs
" Plug 'posva/vim-vue'
" Plug 'leafOfTree/vim-vue-plugin'

"*****************************************************************************
"*****************************************************************************
" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
	source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
" Basic Setup
"*****************************************************************************"
set textwidth=100

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

" Map leader to ,
let mapleader=';'

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac
set updatetime=100
set splitright

" Wrapping
set nowrap

if exists('$SHELL')
	set shell=$SHELL
else
	set shell=/bin/sh
endif

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
	augroup WSLYank
	autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

" Copy/Paste/Cut
" if has('unnamedplus')
" 	set clipboard=unnamed,unnamedplus
" endif


"*****************************************************************************
" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

"let no_buffers_menu=1
colorscheme dracula
hi Normal ctermbg=NONE

" Better command line completion
set wildmenu

" mouse support
set mouse=a

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
	if has("gui_mac") || has("gui_macvim")
		set guifont=Menlo:h12
		set transparency=7
	endif
else
	" IndentLine
	set autoindent
	set smartindent
	" set list lcs=tab:\|\ " there is a blank space

	if $COLORTERM == 'gnome-terminal'
		set term=gnome-256color
	else
		if $TERM == 'xterm'
			set term=xterm-256color
		endif
	endif
endif

if &term =~ '256color'
	set t_ut=
endif

" Disable the blinking cursor.
set gcr=a:blinkon0
autocmd InsertEnter,InsertLeave * set cul! | set culopt=number
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set scrolloff=6
if exists("*fugitive#statusline")
	set statusline+=%{fugitive#statusline()}
endif

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif

" Status bar
set laststatus=3

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

"*****************************************************************************
" Abbreviations
"*****************************************************************************
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

""*****************************************************************************
""" Functions
""*****************************************************************************
if !exists('*s:setupWrapping')
	function s:setupWrapping()
		set wrap
		set wm=2
		set textwidth=100
	endfunction
endif

"*****************************************************************************
" Autocmd Rules
"*****************************************************************************
" Remember cursor position
augroup vimrc-remember-cursor-position
	autocmd!
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" txt
augroup vimrc-wrapping
	autocmd!
	autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
	autocmd!
	autocmd filetype make setlocal noexpandtab
	autocmd bufnewfile,bufread cmakelists.txt setlocal filetype=cmake
augroup end

" Disable auto comment nextline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup hide-statusline-when-fzf
	autocmd! FileType fzf
	autocmd  FileType fzf set laststatus=0 noshowmode noruler
	autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

" Format on save (LSP)
" function! Format()
" 	autocmd! * <buffer>
" 	autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
" endfunction

set autoread

"*****************************************************************************
" Mappings
"*****************************************************************************
" Format
nnoremap gf <cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>

" Split
noremap <Leader>h :<C-u>split<space>
noremap <Leader>v :<C-u>vsplit<space>

" Resize pane
nmap <C-Up> 5<C-w>+
nmap <C-Down> 5<C-w>-
nmap <C-Left> 5<C-w><
nmap <C-Right> 5<C-w>>

" Switching pane
nnoremap <space> <C-w>w
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Nvim-tree
nnoremap <C-b> :NvimTreeToggle<CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Git commit --verbose<CR>
noremap <Leader>gsh :Git push<CR>
noremap <Leader>gll :Git pull<CR>
noremap <Leader>gs :Git<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gd :Gvdiffsplit<CR>
noremap <Leader>gr :GRemove<CR>
" open current line on Github
nnoremap <Leader>o :GBrowse<CR>
command! -nargs=1 Browse silent exec '!open "<args>"'

" Session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" Tabs
nnoremap <silent> <S-t> :tabnew<CR>
noremap te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Comment
noremap <C-_> :Commentary<Return>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" fzf.vim
nmap gf :Files<Return>
" nmap fzf :Files ~<Return>
nmap <leader>rg :Rg<CR>
" Recovery commands from history through FZF
" nmap <leader>r :History:<CR>

" Sneak
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Balance out html tag
nnoremap <leader>b vat

" Floaterm
nnoremap <silent> <leader>f :FloatermToggle<CR>
tnoremap <silent> <leader>f <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <leader>n <C-\><C-n>:FloatermNew<CR>
tnoremap <silent> <leader>k <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent> <leader>j <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <leader>c <C-\><C-n>:FloatermKill<CR>

" Terminal current directory
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Outline
nnoremap <Leader>t :Vista<CR>

" Clipboard
"noremap YY "+y<CR>
"noremap <leader>p "+gP<CR>
"noremap XX "+x<CR>

if has('macunix')
	" pbcopy for OSX copy/paste
	vmap <C-x> :!pbcopy<CR>
	vmap <C-c> :w !pbcopy<CR><CR>
endif

" Select all
nmap <C-a> gg<S-v>G

" Close and save file
noremap <leader>q :bd<CR>
noremap <leader>w :w<CR>

" Buffer
" nav
nnoremap <leader>z :bp<CR>
nnoremap <leader>x :bn<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader><Tab> :b#<CR>
" list
" nnoremap <leader>b :buffers<CR>

" Clean search (highlight)
nnoremap <silent> \ :noh<CR>

" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" coq-nvim popup
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" LSP
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap ge <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap gh <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap ga <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap gwa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap gwl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>

""*****************************************************************************
""" Custom language configs
""*****************************************************************************
"" c
"autocmd FileType c setlocal tabstop=2 shiftwidth=2
"autocmd FileType cpp setlocal tabstop=2 shiftwidth=2

"" html
"" for html files, 2 spaces
"autocmd FileType html setl tabstop=2|setl shiftwidth=2|setl softtabstop=2 smarttab

"" javascript
"let g:javascript_enable_domhtmlcss = 1

"" vim-javascript
"augroup vimrc-javascript
"	autocmd!
"	autocmd FileType javascript setl tabstop=2|setl shiftwidth=2|setl softtabstop=2 noexpandtab
"augroup END

"" python
"" vim-python
"augroup vimrc-python
"	autocmd!
"	autocmd FileType python setlocal shiftwidth=2 tabstop=2 noexpandtab
"				\ formatoptions+=croq softtabstop=2
"				\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"augroup END
"" syntax highlight
"let python_highlight_all = 1

"" typescript
"" let g:yats_host_keyword = 1

"" vuejs
"" vim vue
" let g:vue_disable_pre_processors=1
"" vim vue plugin
"" let g:vim_vue_plugin_load_full_syntax = 1

"" Fish shell syntax highlight
"autocmd BufReadPost *.fish set syntax=vim

"*****************************************************************************
" Extra
"*****************************************************************************

" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
	source ~/.config/nvim/local_init.vim
endif

"*****************************************************************************
" Plugin configs & Convenience variables
"*****************************************************************************
" Nvim-tree
lua << EOF
require'nvim-tree'.setup {
	actions = {
		open_file = {
			quit_on_open = true,
		}
	}
}
EOF

" Lualine
lua << EOF
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {},
		always_divide_middle = true,
		},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
		},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
		},
	tabline = {
		lualine_a = {'buffers'},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {'tabs'}
		},
	extensions = {}
	}
EOF

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
" let g:prettier#config#arrow_parens = 'avoid'
" let g:prettier#config#trailing_comma = 'all'

" emmet-vim
let g:user_emmet_mode='nv'
let g:user_emmet_leader_key = '<leader>y'
let g:user_emmet_expandabbr_key='<leader>m'
let g:user_emmet_update_tag = '<leader>u'
let g:emmet_html5 = 1
" enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,tsx EmmetInstall

" Session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" FZF
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'vsplit' }
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.6, 'yoffset': 2.0 } }

" Sneak
let g:sneak#s_next = 1

" Floaterm
let g:floaterm_title='term: $1/$2'
let g:floaterm_height=0.5
let g:floaterm_width=0.99
let g:floaterm_position='bottomright'
let g:floaterm_borderchars='─│─│╭╮╯╰'
let g:floaterm_opener='edit'
hi FloatermBorder guibg=grey guifg=white

" coq-nvim
let g:coq_settings = { 'auto_start': v:true,
			\ "keymap.recommended": v:false,
			\ 'display.icons.mode': 'short',
			\ 'display.preview.border': 'rounded',
			\ 'keymap.jump_to_mark': '<C-j>',
			\ 'clients.snippets.warn': [],
			\}

" Outline
let g:vista_default_executive = 'nvim_lsp'
let g:vista#renderer#enable_icon = 1
let g:vista_close_on_jump = 1

" LSP
lua << EOF
--Border
local border = {
	{"╭", "NormalFloat"},
	{"─", "NormalFloat"},
	{"╮", "NormalFloat"},
	{"│", "NormalFloat"},
	{"╯", "NormalFloat"},
	{"─", "NormalFloat"},
	{"╰", "NormalFloat"},
	{"│", "NormalFloat"},
}

local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border}),
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

--Go to definition in vsplit
local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

	-- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

			if #result > 1 then
				util.set_qflist(util.locations_to_items(result))
				api.nvim_command("copen")
				api.nvim_command("wincmd p")
			end
		else
			util.jump_to_location(result)
		end
	end

	return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')


--Diagnostic
--config
vim.diagnostic.config({ virtual_text = true, signs = true, underline = true, update_in_insert = false, severity_sort = false })

--symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--Server
local lsp = require'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.tsserver.setup { capabilities = capabilities }
lsp.html.setup { capabilities = capabilities }
lsp.cssls.setup { capabilities = capabilities }
lsp.clangd.setup {}
EOF
