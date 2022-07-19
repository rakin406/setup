set guicursor=
set noerrorbells
set title
set clipboard+=unnamedplus
set number relativenumber
set scrolloff=5
set mouse=a
set nowrap
set colorcolumn=80
set inccommand=split
set signcolumn=number
set hidden
set lazyredraw
set updatetime=300
set shortmess+=c
set smartcase
set magic
set showmatch
set autochdir
set wildmode=list:longest,full
set spelllang=en
set undodir=$HOME/.config/nvim/undodir
set undofile
set noshowmode

" Spell
autocmd BufRead,BufNewFile *.txt,*.md setlocal spell

" Indentation
set expandtab
set shiftwidth=4
set softtabstop=4

command! Config find $HOME/.config/nvim/init.vim

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

let mapleader = " "


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'ericbn/vim-solarized'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
" Plug 'morhetz/gruvbox'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'editorconfig/editorconfig-vim'
Plug 'psf/black'
Plug 'preservim/nerdcommenter'
Plug 'stevearc/vim-arduino'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" Colors
set termguicolors
set background=light
colorscheme solarized
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
" hi Normal guibg=NONE ctermbg=NONE

let g:coq_settings = { 'auto_start': v:true }
lua require("nvim-lsp-installer").setup {}
lua require'lspconfig'.elixirls.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.cssls.setup{}
lua require'lspconfig'.html.setup{}

" LSP configuration
nnoremap <silent> [g :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>

" Markdown configuration
let g:mkdp_refresh_slow = 1
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'dark'
nmap <leader>p <Plug>MarkdownPreviewToggle

" File explorer(netrw)
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

nnoremap <silent> <leader>fe :Lexplore<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Fuzzy finder
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>

let g:rustfmt_autosave = 1

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
