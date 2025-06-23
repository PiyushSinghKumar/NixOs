# My NixOS Desktop Configuration

Welcome to my personal NixOS configuration repository. This is a declarative setup for my daily driver, tailored for development and gaming on a laptop with hybrid AMD & NVIDIA graphics.

## ✨ System Highlights

This configuration builds a complete desktop environment with the following key components:

*   **Operating System**: NixOS
*   **Desktop Environment**: KDE Plasma 6
*   **Display Manager**: SDDM
*   **Sound Server**: PipeWire
*   **Graphics**: Hybrid setup for an AMD iGPU & NVIDIA dGPU (RTX 3050 Ti) with PRIME Render Offload.
*   **Gaming**: Steam, Lutris, Gamemode, and MangoHud are enabled out of the box.
*   **Core Applications**: Brave, VS Code, Discord, OnlyOffice, and more.

## 📂 Directory Structure

The configuration is split into logical modules to keep things organized:

```
.
├── configuration.nix             # Main entry point, ties everything together
├── hardware-configuration.nix    # Auto-generated hardware settings
└── modules/
    ├── drivers.nix               # Hybrid graphics (AMD/NVIDIA) configuration
    └── programs.nix              # System-wide packages and application settings
```

## 🛠️ Installation

To deploy this configuration on a new NixOS machine that has a similar hardware profile:

1.  **Clone the repository**

    Clone this repository into the `/etc/nixos` directory on the target machine.
    ```bash
    git clone <your-repo-url> /etc/nixos
    ```

2.  **Build the system**

    Navigate into the directory and run the standard NixOS rebuild command.
    ```bash
    cd /etc/nixos
    sudo nixos-rebuild switch
    ```

## 🙏 Acknowledgements

A big thank you to the entire Nix/NixOS community for providing the tools and documentation that make a setup like this possible.
