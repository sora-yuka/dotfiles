{ config, pkgs, lib, inputs, ... }:

{
  # Home Manager core setup
  home = {
    username = "copa";
    homeDirectory = "/home/copa";
    stateVersion = "25.05";
  };

  # Imports Modules & Services
  imports = [
    ./modules/apps.nix
    ./modules/dev.nix
    ./modules/fonts.nix
    ./modules/git.nix
    ./modules/spicetify.nix
    ./modules/shell.nix
  ];

  # Nixpkgs configuration
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "spotify" ];
  };

  programs.home-manager.enable = true;
  
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
