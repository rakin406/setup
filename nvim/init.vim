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

tnoremap <Esc> <C-\><C-n>
augroup TerminalConfig
    au!
    au TermOpen * setlocal nospell
    au TermOpen * setlocal list
    au TermOpen * setlocal statusline=%{b:term_title}
augroup END

let mapleader = " "

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'Yggdroot/indentLine'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'nvim-lua/completion-nvim'
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'preservim/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'psf/black'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" Colors
set termguicolors
set background=dark
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1

" File explorer(netrw)
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

nnoremap <silent> <F2> :Lexplore<CR>
nnoremap <silent> <F3> :TagbarToggle<CR>
nnoremap <silent> <F4> :UndotreeToggle<CR>

nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>

let g:rustfmt_autosave = 1

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

source $HOME/.config/nvim/plugins/lsp.vim
