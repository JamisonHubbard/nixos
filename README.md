# Jamison's NixOS Config

This repository contains as much of the configuration for my NixOS installation as I have so far
figured out how to setup in a declarative way

### Structure

- `flake.nix`: I have turned on the flakes experimental feature, and my entire NixOS config is now a flake. The important things to note in this file are:
> - the `nixpkgs` url which is pointed at "unstable" currently
> - sources home-manager and hyprland
> - the "system" type is set in `pkgs`
> - the various flake names, which are device specific, are defined here

- `flake.lock`: the lock file for `flake.nix`

- `configuration.nix`: the heart and soul of the configuration, this file is notable for the following:
> - sets `username` and `city` so they are (somewhat) dynamic
> - pulls in modules from the `systems/` folder to configure certain settings
> - installs all system-wide packages
> - invokes home manager
> - enables flakes

- `home.nix`: the config for home-manager, a NixOS tool for managing user-specific config like
dotfiles, $HOME config, user-level packages, etc...
> - installs user-level packages
> - pulls in modules from the `home/` folder to configure those packages

- `hardware/`: the hardware profiles for my various devices. Each `nixConfiguration` in
`flake.nix` should point to one of these. This makes the flakes defined there 
hardware-specific, meaning things like rebuild commands will change from device to device

- `home/`: Nix modules for configuring packages that are managed by home-manager

- `system/`: Nix modules for configuring NixOS settings

### Usage

##### Setting Up a New Device

1. Install NixOS normally, generating a default `configuration.nix` and `hardware-configuration.nix`
1. TBD

##### Reloading NixOS

1. Determine the flake name used by your device. This should be the name under `nixConfiguration`
that points to your devices hardware profile under `hardware/`.
1. Replace `YOUR_FLAKE_NAME` in the following command with that name:

```bash
sudo nixos-rebuild switch --flake /home/jamison/nixos/#YOUR_FLAKE_NAME
```
