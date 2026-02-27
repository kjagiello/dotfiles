vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'bash', 'c', 'cpp', 'css', 'go', 'html', 'javascript', 'json',
    'python', 'rust', 'typescript', 'vim', 'yaml', 'graphql', 'hcl',
    'terraform', 'sql', 'hurl',
  },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
