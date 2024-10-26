{ pkgs, ... }: {
  
  environment.systemPackages = with pkgs; [
    wget
    git
    home-manager
    
    btop
    fastfetch
    neofetch
    tty-clock

    ventoy
    
    nano
    vim
    neovim
    vscode
    jetbrains.pycharm-community-src
    
    cargo
    rustc
    nodejs
    python3
    
    kitty
    alacritty
    
    hyprshot

    nwg-look
    
    google-chrome
    firefox

    jellyfin-ffmpeg
    vlc
    
    obsidian
    notion
  ];

}
