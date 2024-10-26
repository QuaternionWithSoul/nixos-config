{ ... }: {
  imports = [
    ./system

    ./packages

    ./modules/cloudflare
    ./modules/doas
    ./modules/fonts
    ./modules/hyprland
    ./modules/hyprpaper
    ./modules/rofi
    ./modules/sddm
    ./modules/thunar
    ./modules/virtmanager
    ./modules/waybar
    ./modules/zsh
  ];
}
