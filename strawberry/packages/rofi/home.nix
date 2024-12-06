{ pkgs, ... }: {
  programs.rofi = {
    theme = ./src/theme.rasi;
    terminal = pkgs.alacritty;
  };
}
