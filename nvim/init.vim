set guicursor=
set noerrorbells
set title
set clipboard+=unnamedplus
set number relativenumber
set scrolloff=5
set nowrap
set colorcolumn=80
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
set shiftwidth=4
set softtabstop=4
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
Plug 'bluz71/vim-moonfly-colors'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'

" Better syntax highlighting
Plug 'rust-lang/rust.vim'
" Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'p00f/nvim-ts-rainbow'

" For English writing
Plug 'lewis6991/spellsitter.nvim'
Plug 'rhysd/vim-grammarous'

" Autocompletion
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/trouble.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'simrat39/rust-tools.nvim'

" Debugging
Plug 'puremourning/vimspector'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'vim-test/vim-test'

" Utilities
Plug 'kevinhwang91/nvim-hlslens'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'machakann/vim-sandwich'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'jghauser/mkdir.nvim'

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
let g:moonflyCursorColor = v:true
let g:moonflyItalics = v:false
let g:moonflyTransparent = v:true
colorscheme moonfly
hi CursorLine guibg=NONE
" hi Normal guibg=NONE ctermbg=NONE
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
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
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

" Manage servers and tools
lua <<EOF
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })
    require("mason-lspconfig").setup({
        ensure_installed = { "bashls", "clangd", "jdtls", "cssls", "gopls", "tsserver",
        "pyright", "rust_analyzer" },
        automatic_installation = true
    })
EOF


" Autocompletion configuration
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['jdtls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['rust_analyzer'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['bashls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['dockerls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['cssls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['html'].setup {
    capabilities = capabilities
  }
EOF


" Extra LSP features
lua <<EOF
require("null-ls").setup({
    sources = {
        -- Code actions
        require("null-ls").builtins.code_actions.eslint,
        require("null-ls").builtins.code_actions.shellcheck,

        -- Completions
        require("null-ls").builtins.completion.luasnip,
        require("null-ls").builtins.completion.tags,

        -- Diagnostics
        require("null-ls").builtins.diagnostics.cppcheck,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.diagnostics.flake8,
        require("null-ls").builtins.diagnostics.mypy,
        require("null-ls").builtins.diagnostics.pydocstyle,
        require("null-ls").builtins.diagnostics.pylint,
        require("null-ls").builtins.diagnostics.shellcheck,
        require("null-ls").builtins.diagnostics.tidy,
        require("null-ls").builtins.diagnostics.tsc,
    },
})
EOF


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
nnoremap <leader>xx <cmd>TroubleToggle document_diagnostics<cr>

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
            \ "ColumnLimit": 80,
            \ "AccessModifierOffset": -4,
            \ "AlignAfterOpenBracket": "AlwaysBreak" }
autocmd FileType c,cpp ClangFormatAutoEnable

" Javascript formatter
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0

" Better rust development
let g:rustfmt_autosave = 1
lua require('rust-tools').setup({})
augroup RustSettings
    autocmd!
    autocmd BufNewFile,BufRead *.rs nnoremap <silent> <leader>h :RustToggleInlayHints<CR>
    autocmd BufNewFile,BufRead *.rs nnoremap <silent> <leader>rr :RustRunnables<CR>
    autocmd BufNewFile,BufRead *.rs nnoremap <silent> <leader>rc :RustOpenCargo<CR>
augroup END

" Use arduino from vim
nnoremap <buffer> <leader>au <cmd>ArduinoUpload<CR>
