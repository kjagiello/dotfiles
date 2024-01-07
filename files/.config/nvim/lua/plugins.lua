local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "wbthomason/packer.nvim",
  "scrooloose/nerdtree",
  {
    "junegunn/fzf.vim",
    dependencies = {
      "junegunn/fzf", build = ":call fzf#install()"
    }
  },
  "christoomey/vim-tmux-navigator",
  "michaeljsmith/vim-indent-object",
  { "navarasu/onedark.nvim", lazy = false, priority = 1000 },
  {
      "nvim-treesitter/nvim-treesitter",
      version = ">=0.9.1",
      build = ":TSUpdate",
  },
  {
	"hinell/lsp-timeout.nvim",
	dependencies={ "neovim/nvim-lspconfig" }
  },
  "j-hui/fidget.nvim",
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  },
  "tpope/vim-fugitive",
  "dense-analysis/ale",
  {
    "ojroques/nvim-lspfuzzy",
    config = function()
      require("lspfuzzy").setup()
    end
  },
  "nvim-lualine/lualine.nvim",

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    build = function()
      vim.fn["mkdp#util#install"]()
    end
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },

  { "github/copilot.vim", event = "InsertEnter" },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  "towolf/vim-helm",
  "kaarmu/typst.vim",
})
