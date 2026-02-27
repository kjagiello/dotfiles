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
      lazy = false,
      branch = "main",
      build = ":TSUpdate",
  },
  "neovim/nvim-lspconfig",
  {
	"hinell/lsp-timeout.nvim",
	dependencies={ "neovim/nvim-lspconfig" }
  },
  "j-hui/fidget.nvim",
  {
    "lewis6991/gitsigns.nvim",
    tag = "v1.0.2",
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
      "jmacadie/telescope-hierarchy.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      { -- lazy style key map
        -- Choose your own keys, this works for me
        "<leader>si",
        "<cmd>Telescope hierarchy incoming_calls<cr>",
        desc = "LSP: [S]earch [I]ncoming Calls",
      },
      {
        "<leader>so",
        "<cmd>Telescope hierarchy outgoing_calls<cr>",
        desc = "LSP: [S]earch [O]utgoing Calls",
      },
    },
    opts = {
      extensions = {
        hierarchy = {
          -- telescope-hierarchy.nvim config
          multi_depth = 10, -- How many layers deep should a multi-expand go?
        },
      },
    },
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

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  "towolf/vim-helm",
  "kaarmu/typst.vim",
  "aznhe21/actions-preview.nvim",

  { "nvim-neotest/nvim-nio" },
  {
      "mfussenegger/nvim-dap",
      config = function()
          vim.keymap.set("n", "<leader>d<space>", ":DapContinue<CR>")
          vim.keymap.set("n", "<leader>dl", ":DapStepInto<CR>")
          vim.keymap.set("n", "<leader>dj", ":DapStepOver<CR>")
          vim.keymap.set("n", "<leader>dh", ":DapStepOut<CR>")
          vim.keymap.set("n", "<leader>dz", ":ZoomWinTabToggle<CR>")
          vim.keymap.set(
              "n",
              "<leader>dgt",  -- dg as in debu[g] [t]race
              ":lua require('dap').set_log_level('TRACE')<CR>"
          )
          vim.keymap.set(
              "n",
              "<leader>dge",  -- dg as in debu[g] [e]dit
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
      end,
      lazy = true
  },

  -- A default "GUI" front-end for nvim-dap
  {
      "rcarriga/nvim-dap-ui",
      config = function()
          require("dapui").setup()

      -- Note: Added this <leader>dd duplicate of <F5> because somehow the <F5>
      -- mapping keeps getting reset each time I restart nvim-dap. Annoying but whatever.
      --
      vim.keymap.set(
          "n",
          "<leader>dd",
          function()
              require("dapui").open()  -- Requires nvim-dap-ui

              vim.cmd[[DapContinue]]  -- Important: This will lazy-load nvim-dap
          end
      )
      end,
      dependencies = {
          "mfussenegger/nvim-dap",

          "mfussenegger/nvim-dap-python",  -- Optional adapter for Python
      },
  },

  -- TODO: Make sure that debugpy is installed. Otherwise, disable
  -- Reference: https://github.com/mfussenegger/nvim-dap-python#installation
  --
  {
      "mfussenegger/nvim-dap-python",
      config = function()
          require("dap-python").setup("uv")
          -- An example configuration to launch any Python file, via Houdini
          -- table.insert(
          --     require("dap").configurations.python,
          --     {
          --         type = "python",
          --         request = "launch",
          --         name = "Launch",
          --         program = "${file}",
          --     }
          -- )
      end,
      dependencies = {
          "mfussenegger/nvim-dap",
          "nvim-treesitter/nvim-treesitter",
      },
  },

  -- Remember nvim-dap breakpoints between sessions, ``:PBToggleBreakpoint``
  {
      "Weissle/persistent-breakpoints.nvim",
      config = function()
          require("persistent-breakpoints").setup{
              load_breakpoints_event = { "BufReadPost" }
          }

          vim.keymap.set("n", "<leader>db", ":PBToggleBreakpoint<CR>")
      end,
  }
})
