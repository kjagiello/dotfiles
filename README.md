# Dotfiles

This repo defines a macOS system configuration using nix-darwin, Home Manager and Determinate Nix.


## Setup from scratch

1. Install Determinate Nix:

   ```sh
   curl -L https://install.determinate.systems/nix | sh -s -- install
   ```

3. Clone this repo:

   ```sh
   git clone <REPO_URL> ~/.dotfiles
   cd ~/.dotfiles
   ```

4. Update host/user settings:

   - Edit `flake.nix` and set `username` and `system`.
   - Ensure the host directory matches `<username>-<system>` (for example `hosts/kjagiello-aarch64-darwin`).
   - Set your macOS LocalHostName to the same value:

     ```sh
     sudo scutil --set LocalHostName <username>-<system>
     ```

5. Apply the configuration:

   ```sh
   nix develop -c apply-nix-darwin-configuration
   ```
