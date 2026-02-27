{ username, ... }:
{
  home-manager.users.${username} = {
    pkgs,
    ...
  }:
  {
    imports = [
      ./programs/kitty
      ./programs/neovim
      ./programs/fish
      ./programs/tmux
    ];

    home.packages = with pkgs; [
      delta
      fzf
      git
      htop
      nodejs
      opencode
      restic
      ripgrep
      uv
    ];

    programs.git = {
      enable = true;
      signing = {
        key = "7C5D042DBE7099C2766F322CAFE13CAF5C5A771B";
        signByDefault = true;
      };
      settings = {
        user = {
          name = "Krzysztof Jagiello";
          email = "me@kjagiello.com";
        };
        alias = {
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
          pr = "!f() { git fetch -fu \${2:-origin} refs/pull/$1/head:pr/$1 && git checkout pr/$1; }; f";
          prune = "fetch --prune";
          up = "!f() { git pull origin \${1-$(git rev-parse --abbrev-ref HEAD)} --rebase --autostash; }; f";
        };
        core = {
          editor = "nvim";
          excludesfile = "~/.gitignore_global";
          pager = "delta";
        };
        interactive.diffFilter = "delta --color-only";
        delta = {
          navigate = true;
          dark = true;
          line-numbers = true;
          syntax-theme = "Dracula";
        };
        merge.conflictStyle = "zdiff3";
        commit.gpgsign = true;
        diff.algorithm = "histogram";
        color.ui = true;
        "filter \"lfs\"" = {
          clean = "git-lfs clean -- %f";
          smudge = "git-lfs smudge -- %f";
          process = "git-lfs filter-process";
          required = true;
        };
        init.defaultBranch = "main";
      };
    };

    xdg.configFile."opencode/opencode.json".text = ''
      {
        "$schema": "https://opencode.ai/config.json",
        "mcp": {
          "context7": {
            "type": "local",
            "command": ["npx", "-y", "@upstash/context7-mcp"]
          }
        }
      }
    '';

    home.stateVersion = "24.05";
    home.username = username;
    home.homeDirectory = "/Users/${username}";
  };
}
