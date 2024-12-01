{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    pamixer
    brightnessctl
  ];

  services.xserver.windowManager.awesome.enable = true;
}
