{ username, pkgs, ... }:
{
  system.stateVersion = 1;
  system.primaryUser = username;

  programs.fish.enable = true;

  system.defaults.NSGlobalDomain = {
    AppleInterfaceStyle = "Dark";
    AppleInterfaceStyleSwitchesAutomatically = false;
    InitialKeyRepeat = 25;
    KeyRepeat = 2;
  };

  system.defaults.dock = {
    autohide = true;
  };

  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
    shell = pkgs.fish;
  };
}
