{ ... }: {

  programs.waybar.settings.mainBar = {
    
    "hyprland/workspaces" = {
      active-only = true;
    };
    
    "clock" = {
      interval = 1;
      format = "{:%H:%M:%S - %a, %b %d}";
      tooltip-format = "<tt><small>{calendar}</small></tt>";
    };

    "custom/mem" = {
      format = "{} ";
      interval = 10;
      exec = "free -h | awk '/Mem:/{printf $3}'";
      tooltip = false;
    };

    "cpu" = {
      interval = 1;
      format = "{usage}% ";
    };

    "temperature" = {
      critical-threshold = 80;
      format = "{temperatureC}°C {icon}";
      format-icons = ["" "" "" "" ""];
      tooltip = false;
    };
    
    "hyprland/language" = {
      format-en = "US";
      format-ru = "RU";
    };
    
    "keyboard-state" = {
      capslock = true;
      format = "{icon}";
      format-icons = {
        locked = "";
        unlocked = "";
      };
    };
    
    "pulseaudio" = {
      scroll-step = 10;
      reverse-scrolling = 1;
      format = "{volume}% {icon} {format_source}";
      format-bluetooth = "{volume}% {icon} {format_source}";
      format-bluetooth-muted = " {icon} {format_source}";
      format-muted = " {format_source}";
      format-source = "{volume}% ";
      format-source-muted = "";
      format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = ["" "" ""];
      };
      on-click = "pavucontrol";
    };

    "backlight" = {
      scroll-step = 10;
      device = "intel_backlight";
      format = "{percent}% {icon}";
      format-icons = [""];
    };

  };

}
