{ pkgs, pkgs-stable, ... }: {
  services.displayManager = {
    defaultSession = "none+awesome";

    sddm = {
      enable = true;
      theme = "${import ./theming.nix { inherit pkgs; }}";
      package = pkgs.sddm;
    };
  };
}
