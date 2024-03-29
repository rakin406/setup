return {
  'machakann/vim-sandwich',
  'tpope/vim-fugitive',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'JoosepAlviste/nvim-ts-context-commentstring',
  'mbbill/undotree',  -- Undo history visualizer
  'nvim-treesitter/nvim-treesitter-context',
  'mfussenegger/nvim-lint',

  -- NOTE: This is a very old vim script.
  'vim-scripts/DoxygenToolkit.vim',

  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  {
    -- Better wildmenu autocompletion
    'gelguy/wilder.nvim',
    dependencies = {
      'romgrk/fzy-lua-native',
    },
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  -- LSP configuration & plugins
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP support
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  { 'folke/todo-comments.nvim', opts = {} },

  {
    -- Markdown preview plugin
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
