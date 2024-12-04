{ ... }: {
  services.xserver = {
    enable = true;

    dpi = 96;
    
    xkb = {
      layout = "us,ru";
      options = "grp:alt_shift_toggle";
    };
  };
}
