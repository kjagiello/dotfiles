vim.g.ale_sign_error = "◉"
vim.g.ale_sign_warning = "◉"

vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
vim.g.ale_sign_column_always = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_text_changed = 'never'
vim.g.ale_lint_on_enter = 0

vim.g.ale_open_list = 0
vim.g.ale_set_loclist = 1
vim.g.ale_set_quickfix = 0
vim.g.ale_list_window_size = 5

vim.g.ale_fixers = {
  python = {'isort', 'black'},
  javascript = {'eslint', 'prettier'},
  typescript = {'eslint', 'prettier'},
  terraform = {'terraform'},
  javascriptreact = {'eslint'},
  rust = {'rustfmt'},
  dart = {'dart-format'},
  go = {'gofmt'},
}
vim.g.ale_linters = {
  javascript = {'eslint'},
  terraform = {},
  python = {'flake8', 'mypy'},
  sql = {},
  rust = {'cargo'},
}
