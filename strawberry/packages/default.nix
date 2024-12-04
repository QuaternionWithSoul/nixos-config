{ pkgs, ...}: {
  imports = [
    ./alacritty
    ./awesome
    ./rofi
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
    figma-linux
    blender-hip
    vlc
    obsidian
    notion
    mindustry
    aseprite

    (import ./tlauncher { inherit pkgs; })

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
