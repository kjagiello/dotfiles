local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {
  pickers = {
    -- Manually set sorter, for some reason not picked up automatically
    -- https://github.com/nvim-telescope/telescope.nvim/issues/2104#issuecomment-1223790155
    lsp_dynamic_workspace_symbols = {
      sorter = telescope.extensions.fzf.native_fzf_sorter(fzf_opts)
    },
  },
}

telescope.load_extension('fzf')

vim.keymap.set('n', '<leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<C-e>', builtin.lsp_dynamic_workspace_symbols, {})
