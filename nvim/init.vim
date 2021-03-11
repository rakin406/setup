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

set statusline=%F               " Path to the file
set statusline+=%=              " Switch to the right side
set statusline+=col:\ %c,       " Current column
set statusline+=\ line:\ %l     " Current line
set statusline+=/               " Separator
set statusline+=%L              " Total lines

" Indentation
set expandtab
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:»\ ,trail:·

command! Config find $HOME/.config/nvim/init.vim

" Trim your beard
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

" Imitate emacs
tnoremap <Esc> <C-\><C-n>
augroup TerminalConfig
    au!
    au TermOpen * setlocal nospell
    au TermOpen * setlocal list
    au TermOpen * setlocal statusline=%{b:term_title}
augroup END

" Don't load bloat
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let mapleader = " "

call plug#begin()
" General stuff I need to stay sane
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Make neovim an IDE
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
let g:node_host_prog = '/usr/bin/neovim-node-host'

nnoremap <silent> <F2> :TagbarToggle<CR>
nnoremap <silent> <F3> :UndotreeToggle<CR>

" Telescope for astronomy
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fe :lua require('telescope.builtin').file_browser()<CR>

autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4
let g:rustfmt_autosave = 1

" Imitate jetbrains?
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O

" ALWAYS COMMENT YOUR STUPID CODE
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

source $HOME/.config/nvim/plugins/colors.vim
source $HOME/.config/nvim/plugins/lsp.vim
