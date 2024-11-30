{ config, pkgs, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;

    nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false;
      powerManagement.finegrained = false;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    };
  };

  nixpkgs.config.nvidia.acceptLicense = true;
}
