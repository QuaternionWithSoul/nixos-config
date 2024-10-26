{ ... }: {
  
  wayland.windowManager.hyprland.settings = {

    "$mainMod" = "SUPER";

    bind = [
      "$mainMod, R, exec, pkill rofi || rofi -show drun"

      "$mainMod, Return, exec, alacritty"
      "$mainMod, T, exec, kitty --class=mini-kitty"

      "$mainMod, E, exec, thunar"

      "$mainMod, Q, killactive,"
      "$mainMod, F, togglefloating,"
      "$mainMod, P, pseudo,"
      "$mainMod, D, togglesplit,"

      "CTRL ALT, Delete, exit,"

      "$mainMod, left,  movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up,    movefocus, u"
      "$mainMod, down,  movefocus, d"

      "$mainMod SHIFT, left,  swapwindow, l"
      "$mainMod SHIFT, right, swapwindow, r"
      "$mainMod SHIFT, up,    swapwindow, u"
      "$mainMod SHIFT, down,  swapwindow, d"

      "$mainMod CTRL, left,  resizeactive, -60 0"
      "$mainMod CTRL, right, resizeactive,  60 0"
      "$mainMod CTRL, up,    resizeactive,  0 -60"
      "$mainMod CTRL, down,  resizeactive,  0  60"

      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +20%"
      "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 20%-"

      ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
      ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

      ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
      ", XF86AudioLowerVolume, exec, pamixer -d 5 "
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioMicMute, exec, pamixer --default-source -m"

      ", Print, exec, hyprshot -o ~/ScreenShots -m region"
      "CTRL, Print, exec, hyprshot -o ~/ScreenShots -m region --clipboard-only"
      "SHIFT, Print, exec, hyprshot -o ~/ScreenShots -m output -m active"
      "$mainMod, Print, exec, hyprshot -o ~/ScreenShots -m window"
    ] ++ (
      builtins.concatLists (
        builtins.genList ( i:
          let
            ws = i + 1;
          in [
            "$mainMod, code:1${toString i}, workspace, ${toString ws}"
            "$mainMod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            "$mainMod CTRL, code:1${toString i}, movetoworkspacesilent, ${toString ws}"
          ]
        )
      9)
    );

    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

  };

}