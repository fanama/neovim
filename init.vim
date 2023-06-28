" Set tabstop, shiftwidth, smarttab, and softtabstop
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4

" Enable mouse support
set mouse=a

" Set encoding to UTF-8
set encoding=UTF-8

" Set updatetime
set updatetime=100

" Disable preview in completeopt
set completeopt-=preview

" Don't use swapfile
set noswapfile

" Don't create backup files
set nobackup

" Vertical windows should be split to the right
set splitright

" Horizontal windows should split to the bottom
set splitbelow

" Use non-compatible mode
set nocompatible

" Enable clipboard integration
set clipboard=unnamedplus

" Enable syntax highlighting
syntax on

" Enable filetype plugins
filetype plugin on

" Plug configuration
call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'https://github.com/tpope/vim-fugitive' " Git
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
call plug#end()

" Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" Leader key
vnoremap <SPACE> <Nop>
let mapleader=" "

" vim-Wiki
nmap <Leader>b :VimwikiGoBackLink<CR>

" Center search
nnoremap n nzzzv
nnoremap N Nzzzv

" Terminal
nmap <Leader>t :call OpenTerminal()<CR>
tnoremap <Esc> <C-\><C-n>

" NERDTree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" Alternate way to save
nnoremap <C-s> :w<CR>


" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
	
" Telescope - Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Reload Vim configuration
nnoremap <leader>sv :source $MYVIMRC<CR>

" Markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
  \ 'mkit': {},
  \ 'katex': {},
  \ 'uml': {},
  \ 'maid': {},
  \ 'disable_sync_scroll': 0,
  \ 'sync_scroll_type': 'middle',
  \ 'hide_yaml_meta': 1,
  \ 'sequence_diagrams': {},
  \ 'flowchart_diagrams': {},
  \ 'content_editable': v:false,
  \ 'disable_filename': 0
  \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

" Go
let g:go_auto_type_info = 1
let g:go_doc_popup_window = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_struct_fields_in_popup = 1

" Prettier
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.json Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'editor.action.format')

" Airline symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Autocomplete

" Check if cursor is in a whitespace or start of a line
function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use <TAB> to navigate through popup menu or select an item,
" trigger code completion when there is no popup menu and the cursor is not at a whitespace,
" insert a tab when there is no popup menu and the cursor is at a whitespace.
inoremap <expr> <TAB> pumvisible() ? (coc#_select_confirm() . "\<C-n>") :
  \ !CheckBackSpace() ? coc#start() :
  \ "\<TAB>"

" Use <S-TAB> to navigate in the opposite direction through popup menu
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"


let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" CocHover doc
let g:coc_hover_doc_enable = 1
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! OpenTerminal()
    :terminal powershell
    :set nonumber
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set autowrite
