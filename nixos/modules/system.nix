{ pkgs, ... }:

{
  networking.hostName = "nixos"; # Hostname

  # Enable networking
  networking.networkmanager.enable = true;

  # Set time zone.
  time.timeZone = "Asia/Bishkek";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ky_KG";
    LC_IDENTIFICATION = "ky_KG";
    LC_MEASUREMENT = "ky_KG";
    LC_MONETARY = "ky_KG";
    LC_NAME = "ky_KG";
    LC_NUMERIC = "ky_KG";
    LC_PAPER = "ky_KG";
    LC_TELEPHONE = "ky_KG";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable Zsh system-wide
  programs.zsh.enable = true;

  # User configuration
  users.users.copa = {
    isNormalUser = true;
    description = "copa";
    shell = pkgs.zsh;
    # Group privileges:
    # - networkmanager: Allows toggling WiFi/Ethernet networks without sudo
    # - wheel: Grants administrative access (sudo rights)
    # - docker: Allows running container instances without prepending 'sudo'
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  # Install systemwide packages
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    home-manager
    gnome-tweaks
  ];

  # Maybe add zsh?
}
