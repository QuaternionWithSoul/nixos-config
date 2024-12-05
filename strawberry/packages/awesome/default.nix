{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
    scrot
    rofi
  ];

  services = {
    xserver.windowManager = {
      awesome.enable = true;
    };
    
    clipcat.enable = true;
  };
}
