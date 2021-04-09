lua << EOF
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.pyls.setup{}
EOF

if has('nvim-0.5')
    augroup lsp
        au!
        au FileType java lua require('jdtls').start_or_attach({cmd = {'start-jdtls.sh'}})
    augroup end
endif

nnoremap <silent> [g :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
autocmd BufEnter * lua require'completion'.on_attach()
