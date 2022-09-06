set guicursor=
set noerrorbells
set title
set clipboard+=unnamedplus
set number relativenumber
set scrolloff=5
set nowrap
set colorcolumn=81
set cursorline
set inccommand=split
set signcolumn=number
set nohidden
set lazyredraw
set updatetime=300
set shortmess+=c
set smartcase
set magic
set showmatch
" set autochdir
set wildmode=list:longest,full
set spelllang=en
set spell
set undodir=$HOME/.config/nvim/undodir
set undofile
set noshowmode

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»
set list

" Don't check for perl providers
let g:loaded_perl_provider = 0

" Easy configuration go-to
" command! Config find $HOME/.config/nvim/init.vim

" Remove whitespaces automatically on save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

" Easier mapping
let mapleader = " "
tnoremap <Esc> <C-\><C-n>


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Load plugins
call plug#begin()
" Optimization
Plug 'lewis6991/impatient.nvim'

" UI
Plug 'gelguy/wilder.nvim', { 'on': 'CmdlineEnter' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'morhetz/gruvbox'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'

" Better syntax highlighting
Plug 'rust-lang/rust.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" For English writing
Plug 'lewis6991/spellsitter.nvim'
Plug 'rhysd/vim-grammarous'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Debugging
Plug 'puremourning/vimspector'
Plug 'vim-test/vim-test'

" Utilities
Plug 'kevinhwang91/nvim-hlslens'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-fugitive'

" Formatting
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/vim-clang-format'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --frozen-lockfile --production',
  \ 'branch': 'release/0.x'
  \ }

" Commenting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'numToStr/Comment.nvim'

" Code runner
Plug 'stevearc/vim-arduino', { 'on': 'ArduinoUpload' }

" Explorers
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'pechorin/any-jump.vim', { 'on': 'AnyJump' }
call plug#end()

" Faster startup
lua require('impatient')

" Better autocompletion in command mode
autocmd CmdlineEnter * ++once call s:wilder_init() | call wilder#main#start()
function! s:wilder_init() abort
    call wilder#setup({'modes': [':', '/', '?']})
    call wilder#set_option('pipeline', [
          \   wilder#branch(
          \     wilder#cmdline_pipeline({
          \       'fuzzy': 1,
          \       'fuzzy_filter': wilder#vim_fuzzy_filter(),
          \       'set_pcre2_pattern': 1,
          \     }),
          \     wilder#python_search_pipeline({
          \       'pattern': 'fuzzy',
          \     }),
          \   ),
          \ ])

    let s:highlighters = [
            \ wilder#pcre2_highlighter(),
            \ wilder#basic_highlighter(),
            \ ]

    call wilder#set_option('renderer', wilder#renderer_mux({
          \ ':': wilder#popupmenu_renderer({
          \   'highlighter': s:highlighters,
          \ }),
          \ '/': wilder#wildmenu_renderer({
          \   'highlighter': s:highlighters,
          \ }),
          \ }))
endfunction

" UI
set termguicolors
set background=dark
let g:gruvbox_italic = 0
let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_italicize_comments = 0
colorscheme gruvbox
hi CursorLine guibg=NONE ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
lua require'colorizer'.setup()

" Better syntax highlighting
lua <<EOF
require('nvim-treesitter.configs').setup {
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
}
EOF

" Load some lua plugins
lua require('spellsitter').setup()
lua require('Comment').setup()

" Statusline
lua require('lualine').setup()

" Debugger mappings
" nnoremap <silent> <leader>dc <Cmd>lua require'dap'.continue()<CR>
" nnoremap <silent> <leader>o <Cmd>lua require'dap'.step_over()<CR>
" nnoremap <silent> <leader>i <Cmd>lua require'dap'.step_into()<CR>
" nnoremap <silent> <leader>s <Cmd>lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>dr <Cmd>lua require'dap'.repl.close()<CR>
" nnoremap <silent> <leader>t <Cmd>lua require("dapui").toggle()<CR>

" Unit testing
nmap <silent> <leader>at :TestSuite<CR>

" Jump to definition with explorer
let g:any_jump_disable_default_keybindings = 1
let g:any_jump_search_prefered_engine = 'rg'
nnoremap <leader>j :AnyJump<CR>


" coc.nvim configuration
set completeopt=menu,menuone,noselect
set nobackup
set nowritebackup

" coc.nvim keybindings
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call ShowDocumentation()<CR>
nnoremap <silent> <leader>ca :lua vim.lsp.buf.code_action()<CR>
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)
nnoremap <silent><nowait> <leader>xx :<C-u>CocList diagnostics<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" File explorer(netrw)
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

nnoremap <silent> <leader>fe :Lexplore<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>

" Fuzzy finder configuration
lua <<EOF
require('telescope').setup{ defaults = {
    file_ignore_patterns = { "node_modules" }
    }
}
require('telescope').load_extension('fzy_native')
EOF
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>

" Auto format C/C++
let g:clang_format#style_options = {
            \ "BasedOnStyle": "LLVM",
            \ "IndentWidth": 4,
            \ "UseTab": "Never",
            \ "ColumnLimit": 80 }
autocmd FileType c,cpp ClangFormatAutoEnable

" Javascript formatter
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0

" Rust formatting
let g:rustfmt_autosave = 1

" Use arduino from vim
nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
