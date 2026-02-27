vim.keymap.set("n", "<leader>d<space>", ":DapContinue<CR>")
vim.keymap.set("n", "<leader>dl", ":DapStepInto<CR>")
vim.keymap.set("n", "<leader>dj", ":DapStepOver<CR>")
vim.keymap.set("n", "<leader>dh", ":DapStepOut<CR>")
vim.keymap.set("n", "<leader>dz", ":ZoomWinTabToggle<CR>")
vim.keymap.set(
  "n",
  "<leader>dgt",
  ":lua require('dap').set_log_level('TRACE')<CR>"
)
vim.keymap.set(
  "n",
  "<leader>dge",
  function()
    vim.cmd(":edit " .. vim.fn.stdpath('cache') .. "/dap.log")
  end
)
vim.keymap.set("n", "<F1>", ":DapStepOut<CR>")
vim.keymap.set("n", "<F2>", ":DapStepOver<CR>")
vim.keymap.set("n", "<F3>", ":DapStepInto<CR>")
vim.keymap.set(
  "n",
  "<leader>d-",
  function()
    require("dap").restart()
  end
)
vim.keymap.set(
  "n",
  "<leader>d_",
  function()
    require("dap").terminate()
    require("dapui").close()
  end
)

require("dapui").setup()

vim.keymap.set(
  "n",
  "<leader>dd",
  function()
    require("dapui").open()
    vim.cmd[[DapContinue]]
  end
)

require("dap-python").setup("uv")

require("persistent-breakpoints").setup{
  load_breakpoints_event = { "BufReadPost" }
}

vim.keymap.set("n", "<leader>db", ":PBToggleBreakpoint<CR>")
