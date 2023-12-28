return {
  'machakann/vim-sandwich',
  'tpope/vim-fugitive',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'JoosepAlviste/nvim-ts-context-commentstring',
  'mbbill/undotree',  -- Undo history visualizer
  'nvim-treesitter/nvim-treesitter-context',
  'mfussenegger/nvim-lint',

  -- NOTE: These are very old vim scripts
  'vim-scripts/a.vim',  -- Alternate files quickly (.c --> .h etc)

  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },

  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  { "gbprod/yanky.nvim", opts = {} },

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
      'chrisgrieser/cmp_yanky',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
    },
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
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
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
}
