{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    jetbrains-mono
    fira-code
    cascadia-code
    source-code-pro
    iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    nerd-fonts.meslo-lg
  ];
}
