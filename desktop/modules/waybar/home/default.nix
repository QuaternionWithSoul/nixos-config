{ ... }: {

  imports = [
    ./modules.nix
    ./styles.nix
  ];

  programs.waybar = {

    enable = true;

    settings = {

      mainBar = {

        layer = "top";

        position = "top";

        margin = "4 4 2 4";

        modules-left = [
          "hyprland/workspaces"
          "clock"
        ];

        modules-center = [
          "custom/mem"
          "cpu"
          "temperature"
        ];

        modules-right = [
          "hyprland/language"
          "keyboard-state"
          "pulseaudio"
          "backlight"
        ];

      };

    };

  };

}