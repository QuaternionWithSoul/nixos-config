{ pkgs, ... }: {
  programs.rofi = {
    configPath = ./src/config.rasi;
    terminal = pkgs.alacritty;
  };
}
