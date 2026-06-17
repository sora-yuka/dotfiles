{ ... }:

{
  imports = [
    # Note: Do not modify hardware-configuration.nix!
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/hardware.nix
    ./modules/services.nix
    ./modules/system.nix
  ];
  
  # Enable nixOS unfree apps
  nixpkgs.config.allowUnfree = true;

  # Enable nixOS flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System state version
  system.stateVersion = "25.11";
}
