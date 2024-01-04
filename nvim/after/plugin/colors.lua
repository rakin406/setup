require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = false,
    comments = true,
    operators = false,
    folds = false,
  },
  strikethrough = false,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,    -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
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
