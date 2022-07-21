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
set spell
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
Plug 'lewis6991/impatient.nvim'
Plug 'gelguy/wilder.nvim', { 'on': 'CmdlineEnter' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ericbn/vim-solarized'
Plug 'karb94/neoscroll.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'p00f/nvim-ts-rainbow'
Plug 'stevearc/dressing.nvim'
Plug 'lewis6991/spellsitter.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/trouble.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'petertriho/nvim-scrollbar'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'pechorin/any-jump.vim', { 'on': 'AnyJump' }
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'liuchengxu/vista.vim', { 'on': 'Vista!!' }
Plug 'editorconfig/editorconfig-vim'
Plug 'psf/black'
Plug 'preservim/nerdcommenter'
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'stevearc/vim-arduino', { 'on': 'ArduinoUpload' }
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
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
set background=light
colorscheme solarized
" let g:gruvbox_italic = 1
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()

lua <<EOF
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
EOF

lua require('spellsitter').setup()
" hi Normal guibg=NONE ctermbg=NONE
lua require('lualine').setup()
lua require('neoscroll').setup()
lua require('gitsigns').setup()


" Tabs from the awesome barbar plugin
" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>

let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true


" LSP configuration
let g:coq_settings = { 'auto_start': v:true }
lua require("nvim-lsp-installer").setup {}
lua require'lspconfig'.elixirls.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.cssls.setup{}
lua require'lspconfig'.html.setup{}


" Better defaults for LSP actions
lua <<EOF
if vim.fn.has('nvim-0.5.1') == 1 then
    vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
    vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
    vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
    vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)

    vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
        require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
    end

    vim.lsp.handlers['textDocument/references'] = function(_, _, result)
        require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
        require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
        require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
        require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
        require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
    end

    vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
end
EOF


" Jump to definition with explorer
let g:any_jump_disable_default_keybindings = 1
let g:any_jump_search_prefered_engine = 'rg'
nnoremap <leader>j :AnyJump<CR>

" VSCode vibe :)
lua require('nvim-lightbulb').setup({autocmd = {enabled = true}})

" LSP keybindings
nnoremap <silent> [g :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>

" For code error navigation
lua require("trouble").setup {}
nnoremap <leader>xx <cmd>TroubleToggle<cr>

lua require("scrollbar").setup()
lua require("scrollbar.handlers.search").setup()

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

" A better file explorer
lua require("nvim-tree").setup()

" Tag viewer and finder
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" nnoremap <silent> <leader>fe :Lexplore<CR>
nnoremap <silent> <leader>fe :NvimTreeToggle<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <leader>t :Vista!!<CR>

" Fuzzy finder image preview
lua require('telescope').load_extension('media_files')
lua <<EOF
require'telescope'.setup {
  extensions = {
    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg"
    }
  },
}
EOF

" Fuzzy finder keybinding
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>

let g:rustfmt_autosave = 1

" Easy commenting
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
nnoremap <leader>c<space> <plug>NERDCommenterToggle

nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
