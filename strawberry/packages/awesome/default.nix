{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
    scrot
    rofi
    clipcat
  ];

  services = {
    xserver.windowManager = {
      awesome.enable = true;
    };
    
    clipcat.enable = true;
  };
}
