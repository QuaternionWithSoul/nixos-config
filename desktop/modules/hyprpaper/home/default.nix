{ ... }: {

  services.hyprpaper = {

    enable = true;

    settings = 
    let
      paperDir = ./wallpaper.png;
    in {

      preload = [
        "${paperDir}"
      ];

      wallpaper = [
        ",${paperDir}"
      ];

    };

  };

}
