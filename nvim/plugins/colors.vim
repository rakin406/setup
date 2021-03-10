let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark

" Don't burn my precious eyes
let g:gruvbox_invert_selection = 0
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
" colorscheme onedark

hi Normal ctermbg=NONE guibg=NONE
autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
