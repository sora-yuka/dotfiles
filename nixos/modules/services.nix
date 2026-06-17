{ ... }:

{
  services.xserver.enable = true; # Enable the underlying X11 engine
  programs.hyprland.enable = true; # Enable Hyprland WM

  # X11 Keyboard layout matrix
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true; # Enables CUPS
  services.postgresql.enable = true; # Background PostgreSQL database server engine

  # Enables the Docker engine. Adds a system systemd service and isolates storage.
  virtualisation.docker.enable = true;
}
