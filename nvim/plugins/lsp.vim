lua << EOF
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.pyls.setup{}
require'lspconfig'.html.setup{}
EOF

nnoremap <silent> [g :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gy :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>ac :lua vim.lsp.buf.code_action()<CR>

" Save your precious time
set completeopt=menuone,noinsert,noselect
augroup CompletionTriggerCharacter
    autocmd!
    autocmd BufEnter * let g:completion_trigger_character = ['.']
    autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::']
augroup end

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_enable_snippet = 'UltiSnips'
autocmd BufEnter * lua require'completion'.on_attach()
