{ pkgs, ... }: {
  home.file.".local/share/rofi/themes".source = ./src;

  programs.rofi = {
    terminal = pkgs.alacritty;
  };
}
