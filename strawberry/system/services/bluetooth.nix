{ ... }: {
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;

    bluetooth = {
      enable = true;
      package = pkgs.bluez5-experimental;

      powerOnBoot = true;

      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Name = "Hello";
          ControllerMode = "dual";
          FastConnectable = "true";
          Experimental = "true";
          KernelExperimental = "true";
        };

        Policy = {
          AutoEnable = "true";
        };
      };
    };
  };

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    bluez-experimental 
    bluez-tools
    bluez-alsa
    bluetuith
  ];
}
