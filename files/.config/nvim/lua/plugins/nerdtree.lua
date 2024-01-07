local map = require('core/utils').map

-- A workaround for a bug where the prompt does not disappear
-- Issue: https://github.com/preservim/nerdtree/issues/1321
vim.g.NERDTreeMinimalMenu = 1

-- Hide the "Press ? for help" at the top of the tree UI
vim.g.NERDTreeMinimalUI = 1

-- Hide following files and directories from the tree
vim.g.NERDTreeIgnore = {'\\.pyc$', '__pycache__', '\\.DS_Store', '^\\.?venv$'}

-- Keymaps
map('n', '<leader>nn', ':NERDTreeToggle<CR>')
map('n', '<leader>nf', ':NERDTreeFind<CR>')
