local g = vim.g
local opt = vim.opt

-- Enable mouse support
opt.mouse = 'a'

-- Use the system clipboard
opt.clipboard = 'unnamedplus'

-- Disable swap files
opt.swapfile = false

-- Autocomplete options
opt.completeopt = 'menuone,noinsert,noselect'

-- Show line numbers
opt.number = true

-- Highlight matching parenthesis
opt.showmatch = true

-- Vertical marker at 80 columns
opt.colorcolumn = "80"

-- Enable 24 bit colors
opt.termguicolors = true

-- Use spaces instead of tabs
opt.expandtab = true

-- Tab with 4 spaces
opt.shiftwidth = 4
opt.tabstop = 4

-- Autoindent new lines
opt.smartindent = true

-- Enable background buffers
opt.hidden = true

-- Faster scrolling
opt.lazyredraw = true

-- Time [ms] to wait for triggering an event
opt.updatetime = 250

-- Disable the default splash screen
opt.shortmess:append "sI"

-- Disable builtin plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
