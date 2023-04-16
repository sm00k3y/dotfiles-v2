require("lualine").setup({
  options = {
    theme = "tokyonight",
    disabled_filetypes = { 'packer', 'NvimTree' } -- Lualine will not show in NvimTree
  }
})
