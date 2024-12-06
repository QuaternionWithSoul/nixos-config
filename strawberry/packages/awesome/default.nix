{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
    scrot
  ];

  services.xserver.windowManager.awesome.enable = true;
}
