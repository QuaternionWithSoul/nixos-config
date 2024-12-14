{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
    scrot
    xdotool
  ];

  services.xserver.windowManager.awesome.enable = true;
}
