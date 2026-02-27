local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
  return
end

local on_attach = function(ev)
  local bufnr = ev.buf
  local client = vim.lsp.get_client_by_id(ev.data.client_id)

  if client.name == 'ruff' then
    client.server_capabilities.hoverProvider = false
  end

  local telescope = require('telescope.builtin')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<leader>lD', telescope.lsp_type_definitions, bufopts)
  vim.keymap.set('n', '<leader>ld', telescope.lsp_definitions, bufopts)
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>li', telescope.lsp_implementations, bufopts)
  vim.keymap.set('n', '<leader>lk', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>la', require("actions-preview").code_actions, bufopts)
  vim.keymap.set('n', '<leader>lx', telescope.lsp_references, bufopts)
  vim.keymap.set('n', '<leader>le', function() vim.diagnostic.open_float(nil, { focus = false }) end, bufopts)
  vim.keymap.set('i', '<C-x><C-o>', require('cmp').complete, bufopts)
end

vim.diagnostic.config({
  update_in_insert = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local root_dir = function()
  return vim.fn.getcwd()
end

local servers = {
    'bashls', 'clangd', 'html', 'cssls', 'ts_ls', 'rust_analyzer',
    'graphql', 'pyright', 'ruff', 'phpactor', 'tailwindcss', 'astro'
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = on_attach
})

for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
