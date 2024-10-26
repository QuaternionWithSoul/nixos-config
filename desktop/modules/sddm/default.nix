{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
    (callPackage ./simple-sddm.nix{}).simple-sddm
    libsForQt5.qt5.qtgraphicaleffects
  ];

  services = {

    xserver ={
      enable = true;
      xkb.layout = "us";
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "simple-sddm";
      };
    };
    
  };

}
