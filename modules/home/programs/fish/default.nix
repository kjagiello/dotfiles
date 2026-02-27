{ ... }:
{
  xdg.configFile."fish/config.fish".source = ./files/config.fish;
  xdg.configFile."fish/fish_plugins".source = ./files/fish_plugins;

  xdg.configFile."fish/completions/workon.fish".source = ./files/completions/workon.fish;

  xdg.configFile."fish/functions/fish_prompt.fish".source = ./files/functions/fish_prompt.fish;
  xdg.configFile."fish/functions/flog.fish".source = ./files/functions/flog.fish;
  xdg.configFile."fish/functions/venv.fish".source = ./files/functions/venv.fish;
  xdg.configFile."fish/functions/workon.fish".source = ./files/functions/workon.fish;
}
