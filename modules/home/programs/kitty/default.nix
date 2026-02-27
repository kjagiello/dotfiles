{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      font_size = 13.0;
      hide_window_decorations = "yes";
      mouse_hide_wait = 3;
      shell = "${pkgs.fish}/bin/fish";
    };
    extraConfig = ''
      include theme.conf

      map cmd+1 send_text all \x021
      map cmd+2 send_text all \x022
      map cmd+3 send_text all \x023
      map cmd+4 send_text all \x024
      map cmd+5 send_text all \x025
      map cmd+6 send_text all \x026
      map cmd+7 send_text all \x027
      map cmd+8 send_text all \x028
      map cmd+9 send_text all \x029

      map alt+space send_text all \x02z
    '';
  };

  xdg.configFile."kitty/theme.conf".text = ''
    background #1e1e1e
    foreground #b8bcb9
    cursor #eee
    selection_background #efcc00
    color0 #3a3c43
    color8 #888987
    color1 #be3e48
    color9 #fb001e
    color2 #869a3a
    color10 #0e712e
    color3 #c4a535
    color11 #c37033
    color4 #4e76a1
    color12 #176ce3
    color5 #855b8d
    color13 #fb0067
    color6 #568ea3
    color14 #2d6f6c
    color7 #b8bcb9
    color15 #fcffb8
    selection_foreground #1e1e1e
  '';
}
