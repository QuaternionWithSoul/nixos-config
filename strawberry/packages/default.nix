{ pkgs, prismlauncher, ...}: {
  imports = [
    ./alacritty
    ./awesome
    ./sddm
    ./zsh

    ./doas.nix
    ./fonts.nix
    ./langs.nix
    ./thunar.nix
    ./tmux.nix
    ./xorg.nix
  ];

  environment.systemPackages = with pkgs; [
    google-chrome
    vscode
    discord
    vesktop
    figma-linux
    blender
    vlc
    obsidian
    notion
    mindustry
    aseprite
    obs-studio
    vesktop
    
    (import (
      builtins.fetchTarball "https://github.com/PrismLauncher/PrismLauncher/archive/develop.tar.gz"
    )).packages.${pkgs.system}.prismlauncher

    nix-prefetch-git
    home-manager
    fastfetch
    neofetch
    nerdfetch
    fet-sh
    pfetch-rs
    tty-clock
    pipes
    nnn
    ranger
    superfile
    yazi
    jellyfin-ffmpeg
    unzip
    lshw
    btop
    wget
    tree
    openjdk
    lshw
    cava
  ];

  programs = {
    firefox.enable = true;
    nano.enable = true;
    git.enable = true;
    direnv.enable = true;
    dconf.enable = true;
  };

  networking.networkmanager.enable = true;

  services.cloudflare-warp.enable = true;



  nixpkgs.config.allowUnfree = true;
}
