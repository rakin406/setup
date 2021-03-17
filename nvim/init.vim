let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
let g:node_host_prog = '/usr/bin/neovim-node-host'

set noerrorbells
set title
set clipboard+=unnamedplus
set number relativenumber
set scrolloff=5
set mouse=a
set nowrap
set guicursor=
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
set nobackup
set noswapfile
set nowritebackup
set spelllang=en
" set spell
set undodir=$HOME/.config/nvim/undodir
set undofile

set statusline=%F
set statusline+=%=
set statusline+=col:\ %c,
set statusline+=\ line:\ %l
set statusline+=/
set statusline+=%L

set expandtab
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:»\ ,trail:·

command! Config find $HOME/.config/nvim/init.vim

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

tnoremap <Esc> <C-\><C-n>
augroup TerminalConfig
  au!
  au TermOpen * setlocal nospell
  au TermOpen * setlocal list
  au TermOpen * setlocal statusline=%{b:term_title}
augroup END

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let mapleader = " "

call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'nvim-lua/completion-nvim'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'psf/black'
Plug 'preservim/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

set background=dark
let g:gruvbox_invert_selection = 0
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

nnoremap <silent> <F2> :TagbarToggle<CR>
nnoremap <silent> <F3> :UndotreeToggle<CR>

nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fe :lua require('telescope.builtin').file_browser()<CR>

let g:rustfmt_autosave = 1

inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

source $HOME/.config/nvim/plugins/lsp.vim
