vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "number"

vim.opt.updatetime = 250

vim.opt.completeopt = "menuone,noselect"

vim.opt.termguicolors = true

vim.opt.colorcolumn = "81"

vim.opt.title = true
vim.opt.lazyredraw = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.spell = true

vim.opt.listchars:append{tab = "‣ " , trail = "·", precedes = "«", extends = "»"}
vim.opt.list = true
