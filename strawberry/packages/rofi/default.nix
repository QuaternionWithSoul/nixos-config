{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    rofi
    wl-clipboard
    cliphist
  ];
}
