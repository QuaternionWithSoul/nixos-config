{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    rofi
    scrot
    wl-clipboard
    cliphist
  ];
}
