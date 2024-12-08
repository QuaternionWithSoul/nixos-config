{ config, pkgs, ... }: {
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;

      powerManagement.enable = true;
      powerManagement.finegrained = false;

      prime = {
        sync.enable = true;
        
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    };
  };

  environment.systemPackages = [ pkgs.mesa-demos ];

  nixpkgs.config.nvidia.acceptLicense = true;
}
