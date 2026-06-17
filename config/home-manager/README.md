# ❄️ NixOS Home Manager Configuration

A modular, flake-driven Home Manager configuration for managing user environments declaratively.

> **Storage Location:** `~/.config/home-manager`

## 📂 Repository Structure

The configuration is split into distinct, semantic modules to maintain readability and scalability:

```text
.
├── flake.nix             # System inputs and flake entry point
├── home.nix              # Core identity setup & global settings
└── modules/
    ├── apps.nix          # Desktop apps, Hyprland/GNOME styling & CLI tools
    ├── dev.nix           # Development stacks (Node, Python, Docker, DBs)
    ├── fonts.nix         # Typography and system-wide fontconfig
    ├── git.nix           # Git user profile & extra configs
    └── spicetify.nix     # Themed Spotify client setup
```

## 🚀 Deployment & Updates

1. Installation

    Clone or copy repository directly into local configuration directory:
    ```Bash
    git clone git@github.com:sora-yuka/home-manager.git ~/.config/home-manager
    ```

2. Apply changes

    To rebuild the environment and activate added packages or configuration changes, run:
    ```Bash
    home-manager switch
    ```

3. Update dependencies

   To lock down newer package versions from input channels and update `flake.lock` file, execute:
   ```Bash
   home-manager switch --flake ~/.config/home-manager
   ```
