{ pkgs, ... }: {

  boot.kernelModules = [ "nouveau" ];

  boot.blacklistedKernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" "nvidia_modeset" ];

  hardware = {

    graphics = {

      enable = true;

      extraPackages = with pkgs; [
        mesa
        mesa.drivers
      ];

    };

  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver.videoDrivers = [ "nouveau" ];

}
