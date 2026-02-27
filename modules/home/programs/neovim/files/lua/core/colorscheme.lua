require('onedark').setup({
  style = 'warmer',
  toggle_style_key = '<leader>ts',
  highlights = {
    ["@nospell"] = { fg = "none" },
    ["@spell"] = { fg = "none" },
  },
})
vim.cmd('colorscheme onedark')

require("onedark").setup({
})
