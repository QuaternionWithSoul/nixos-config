{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (callPackage ./theming.nix{})
    libsForQt5.qt5.qtgraphicaleffects
  ];

  services.displayManager = {
    defaultSession = "none+awesome";

    sddm = {
      enable = true;
      theme = "my-sddm-theme";
    };
  };
}
