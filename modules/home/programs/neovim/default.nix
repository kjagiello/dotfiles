{ pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      fzf
      nodePackages.bash-language-server
      clang-tools
      nodePackages.vscode-langservers-extracted
      nodePackages.typescript
      nodePackages.typescript-language-server
      rust-analyzer
      nodePackages.graphql-language-service-cli
      pyright
      ruff
    ];
  };

  xdg.configFile."nvim/init.lua".source = ./files/init.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = ./files/lua/plugins.lua;
  xdg.configFile."nvim/lazy-lock.json".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/home/programs/neovim/files/lazy-lock.json";

  xdg.configFile."nvim/lua/core/options.lua".source = ./files/lua/core/options.lua;
  xdg.configFile."nvim/lua/core/keymaps.lua".source = ./files/lua/core/keymaps.lua;
  xdg.configFile."nvim/lua/core/utils.lua".source = ./files/lua/core/utils.lua;
  xdg.configFile."nvim/lua/core/autocmds.lua".source = ./files/lua/core/autocmds.lua;
  xdg.configFile."nvim/lua/core/colorscheme.lua".source = ./files/lua/core/colorscheme.lua;
  xdg.configFile."nvim/lua/core/pythonx.lua".source = ./files/lua/core/pythonx.lua;

  xdg.configFile."nvim/lua/plugins/fzf.lua".source = ./files/lua/plugins/fzf.lua;
  xdg.configFile."nvim/lua/plugins/gitsigns.lua".source = ./files/lua/plugins/gitsigns.lua;
  xdg.configFile."nvim/lua/plugins/lspconfig.lua".source = ./files/lua/plugins/lspconfig.lua;
  xdg.configFile."nvim/lua/plugins/lspfuzzy.lua".source = ./files/lua/plugins/lspfuzzy.lua;
  xdg.configFile."nvim/lua/plugins/nerdtree.lua".source = ./files/lua/plugins/nerdtree.lua;
  xdg.configFile."nvim/lua/plugins/treesitter.lua".source = ./files/lua/plugins/treesitter.lua;
  xdg.configFile."nvim/lua/plugins/telescope.lua".source = ./files/lua/plugins/telescope.lua;
  xdg.configFile."nvim/lua/plugins/lualine.lua".source = ./files/lua/plugins/lualine.lua;
  xdg.configFile."nvim/lua/plugins/sql.lua".source = ./files/lua/plugins/sql.lua;
  xdg.configFile."nvim/lua/plugins/cmp.lua".source = ./files/lua/plugins/cmp.lua;
  xdg.configFile."nvim/lua/plugins/copilot.lua".source = ./files/lua/plugins/copilot.lua;
  xdg.configFile."nvim/lua/plugins/dap.lua".source = ./files/lua/plugins/dap.lua;
  xdg.configFile."nvim/lua/plugins/ale.lua".source = ./files/lua/plugins/ale.lua;
}
