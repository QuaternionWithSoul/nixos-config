{ ... }: {
    
  boot = {

    loader = {

      systemd-boot.enable = true;
      
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

    };

  };

}
