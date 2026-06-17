{ pkgs, inputs, ... }:

let
  sys = pkgs.stdenv.hostPlatform.system;
  zen-browser = inputs.zen-browser.packages."${sys}".default;
  helium      = inputs.helium.packages."${sys}".default;
in
{
  home.packages = with pkgs; [
    # System Utilities
    nix-prefetch-git
    unzip
    fastfetch
    pywal
    timg

    # GUI Applications
    ghostty
    zen-browser
    helium
    telegram-desktop
    discord
    vim
    gapless
    amberol
    yazi

    # Desktop Environment & Theming
    waybar
    rofi
    hyprshot
    hyprpaper
    cava
    nwg-look
    pavucontrol
    gnomeExtensions.blur-my-shell
    gnomeExtensions.coverflow-alt-tab
  ];
}
