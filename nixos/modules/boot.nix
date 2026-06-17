{ pkgs, ... }:

let
  yorhaTheme = pkgs.fetchFromGitHub {
    owner = "OliveThePuffin";
    repo = "yorha-grub-theme";
    rev = "4d9cd37baf56c4f5510cc4ff61be278f11077c81";

    # Generated via: nix-prefetch https://github.com/feanorknd/feanor-grub-theme --rev 4d9cd37...
    hash = "sha256-XVzYDwJM7Q9DvdF4ZOqayjiYpasUeMhAWWcXtnhJ0WQ=";
  };

  feanorTheme = pkgs.fetchFromGitHub {
    owner = "feanorknd";
    repo = "feanor-grub-theme";
    rev = "947aee5f845d8a2a667c469093cc33f664dcee44";

    # Generated via: nix-prefetch https://github.com/feanorknd/feanor-grub-theme --rev 947aee5...
    hash = "sha256-fPlTqByEpYvB345ZZD0JzZQfqI7ya2A9KbpAz8iXhlM=";
  };

  marathonTheme = pkgs.fetchFromGitHub {
    owner = "Woysful";
    repo = "Marathon-Grub-Themes";
    rev = "a235901b118010947776dd2f4624f074e99ca2a4";
    hash = "sha256-WcPuFoyIESUwSmOa6wK6+3p7O13l+eziHU4jIEIY9Pw=";
  };
in
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    # Note: Enabling both systemd-boot and GRUB can cause conflicts.
    # Ensure your system expects GRUB as the primary bootloader.
    systemd-boot.enable = false;

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true; # Autommatically detects other OSs (Windows, etc.)

      # Note: Match path where `theme.txt` located in repository.
      # Example: theme = "${yorhaTheme}/yorha-1920x1080";
      theme = "${yorhaTheme}/yorha-1920x1080";
    };
  };

  # nvidia_drm.modeset=1 is crucial for Wayland compositors (like Hyprland) to prevent screen tearing
  # and ensure the NVIDIA kernel driver initializes before the display manager starts.
  boot.kernelParams = [ "nvidia_drm.modeset=1" ];
}
