{ pkgs, ...}: {
  imports = [
    ./alacritty
    ./awesome
    ./clipcat
    ./rec
    ./rofi
    ./sddm
    ./zsh

    ./doas.nix
    ./fonts.nix
    ./langs.nix
    ./prism.nix
    ./thunar.nix
    ./tmux.nix
    ./xorg.nix
  ];

  environment.systemPackages = with pkgs; [
    google-chrome
    vscode
    discord
    figma-linux
    vlc
    obsidian
    mindustry
    lutris

    nix-prefetch-git
    home-manager
    fastfetch
    neofetch
    fet-sh
    pfetch-rs
    tty-clock
    pipes
    jellyfin-ffmpeg
    unzip
    unrar
    btop
    wget
    tree
    openjdk
    lshw
    cava
    xcolor
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
