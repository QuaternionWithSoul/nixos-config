{ ... }: {

  imports = [
    ./autostart.nix
    ./input.nix
    ./keybinds.nix
    ./monitors.nix
  ];

  wayland.windowManager.hyprland.settings = {
      
    general = {
      gaps_in = 2;
      gaps_out = 4;
      border_size = 2;
      "col.active_border" = "rgba(000000aa) rgba(ffffffaa) 45deg";
      "col.inactive_border" = "rgba(00000000)";
    };

    decoration = {
      blur.enabled = false;
      rounding = 6;
    };

    animations = {

      enabled = true;

      bezier = "myBezier, 0, 0, 0, 1";

      animation = [
        "windows,     1, 5,  myBezier"
        "windowsOut,  1, 5,  default, popin 80%"
        "border,      1, 7, default"
        "borderangle, 1, 6,  default"
        "fade,        1, 5,  default"
        "workspaces,  1, 4,  default"
      ];

    };

  };

}
