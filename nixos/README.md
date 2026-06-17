# ❄️ NixOS Configuration

My modular, declarative NixOS system configuration. This repository features a highly responsive Wayland environment powered by **Hyprland**, side-by-side with **GNOME**, fully optimized for **NVIDIA** hardware.

## 📂 Repository Structure

The configuration is broken down into modular files to keep the system organized and maintainable:

* `configuration.nix` — Central hub; imports all modules and manages global flags.
* `hardware-configuration.nix` — Hardware-specific file layout and system architecture scans (machine-dependent).
* `modules/`
    * `boot.nix` — Kernel parameters, EFI management, and custom GRUB themes (Feanor/YoRHa).
    * `hardware.nix` — NVIDIA proprietary graphics drivers and the PipeWire audio pipeline.
    * `services.nix` — X11, Display/Desktop Managers (GDM, GNOME, Hyprland), Docker, and PostgreSQL.
    * `system.nix` — Localization, user profiles, Zsh/Oh-My-Zsh environments, and core system utilities.

&ensp;

## 🛠️ Direct Editing Mode (On an Active System)

If you are currently working directly inside `/etc/nixos/` and need to temporarily grant VS Code or another GUI editor write access without a Polkit agent, run the following:

```bash
# Temporarily hand file ownership to your local user
sudo chown -R $USER /etc/nixos/

# [Make your changes in your editor here]

# Revert ownership back to root when finished (NixOS Best Practice)
sudo chown -R root:root /etc/nixos/
```

&ensp;

## 🚀 Fresh Installation & Deployment Guide

Follow these steps to safely restore this identical system environment onto a clean NixOS installation.

1. Provision the Machine

    Install a fresh instance of NixOS using any standard graphical installer ISO, complete your partition layout, and boot into the fresh system.

2. Clone the Configurations

    Clone this repository directly into a custom dotfiles directory within your user space:

    `git clone https://github.com/sora-yuka/nixos-configuration.git ~/.dots/nixos-config`

3. Bind the New Hardware Footprint

    Every computer generates unique storage drive UUIDs and CPU thread profiles. Never overwrite a fresh system's hardware configurations. Instead, copy the freshly scanned layout into your cloned repository directory to act as your machine profile:

    ```Bash
    cp /etc/nixos/hardware-configuration.nix ~/.dots/nixos-config/
    ```

4. Build and Switch Execution

    Instruct the Nix package manager to evaluate and switch to your modular system configuration by referencing your home directory path target:

    ```Bash
    sudo nixos-rebuild switch -I nixos-config=~/.dots/nixos-config
    ```
