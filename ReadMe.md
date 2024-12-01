# NixOS Configuration with Flakes

This repository contains my NixOS configuration managed with Flakes. It includes multiple host-specific configurations:

- **strawberry**: Uses Xorg, focuses on stability, and is frequently updated.
- **blueberry**: Uses Wayland and is updated less frequently.

## Installation

Clone the repository:

```bash
git clone https://github.com/QuaternionWithSoul/nixos-config.git
```

Copy your hardware configuration:

```bash
cd nixos-config
cp /etc/nixos/hardware-configuration.nix ./hardware.nix
```

Update `flake.nix`:

- Replace `hostname` and `username` values with your own.

Build and apply the NixOS configuration:

```bash
sudo nixos-rebuild switch --flake .#<host>
```

Apply the home-manager configuration:

```bash
home-manager switch --flake .#<host>
```

Replace `<host>` with your target host, e.g., `strawberry` or `blueberry`.

## Env

 **Window Manager**  | Awesome
:-------------------:|:---------:
 **File Manager**    | Thunar
 **Terminal**        | Alacritty
 **Menu**            | Rofi
 **Display Manager** | Sddm
 **Shell**           | Zsh
