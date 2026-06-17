{ config, ... }:

{
  # NVIDIA Driver configuration
  hardware.nvidia = {
    # Required for Wayland and proper display resolution scaling.
    modesetting.enable = true;

    # NVIDIA Open Source Kernel Module Toggle:
    # - Set to 'true' if using a Turing or newer GPU (RTX series, GTX 16xx).
    # - Keep 'false' if using an older GPU (GTX 10xx or older Pascal/Maxwell architectures).
    open = false;

    # Installs the nvidia-settings graphical control panel app.
    nvidiaSettings = true;

    # Pins the driver to the current stable production release matching your active kernel.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Audio pipeline (PipeWire)
  # Disable legacy ALSA/PulseAudio daemons to prevent hardware conflicts.
  services.pulseaudio.enable = false;

  # RealtimeKit gives PipeWire processes high-priority scheduling to eliminate audio crackling under heavy CPU load.
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true; # Enables the ALSA emulation layer
    alsa.support32Bit = true; # Required for 32-bit applications (like Steam/Proton games)
    pulse.enable = true; # Enables PulseAudio emulation so standard apps drop right in
  };
}
