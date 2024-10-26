{ pkgs, ... }: {

  imports = [
    ./styles.nix
  ];

  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
  };

}
