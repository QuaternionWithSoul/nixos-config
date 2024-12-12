{ pkgs, ... }: {
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    fastfetch
    neofetch
    fet-sh
    pfetch-rs

    tty-clock

    pipes

    btop

    tree
    
    cava
  ];
}
