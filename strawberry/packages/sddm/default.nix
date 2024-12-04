{ pkgs, ... }: {
  environment.systemPackages = with pkgs.libsForQt5.qt5; [
    qtgraphicaleffects
    qtquickcontrols2
  ];

  services.displayManager = {
    defaultSession = "none+awesome";

    sddm = {
      enable = true;
      theme = "${import ./theming.nix { inherit pkgs; }}";
    };
  };
}
