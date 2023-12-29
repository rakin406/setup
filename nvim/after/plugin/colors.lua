require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = false,
  underline = false,
  bold = false,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = false,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,    -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})

local function ColorMyPencils(color)
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)

  if color == "gruvbox" then
    vim.api.nvim_set_hl(0, "@namespace", { link = "GruvboxAqua" })
    vim.api.nvim_set_hl(0, "@variable", { link = "GruvboxBlue" })
  end
end

ColorMyPencils()
