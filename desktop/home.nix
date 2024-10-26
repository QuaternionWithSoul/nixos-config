{ username, systemver, ... }: {

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "${systemver}";
  };

  imports = [
    ./modules/hyprland/home
    ./modules/hyprpaper/home
    ./modules/rofi/home
    ./modules/waybar/home
    ./modules/zsh/home
  ];
  
}
