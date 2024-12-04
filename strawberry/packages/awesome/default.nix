{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
    scrot
    rofi
    wl-clipboard
    cliphist
  ];

  services.xserver.windowManager.awesome.enable = true;
}
