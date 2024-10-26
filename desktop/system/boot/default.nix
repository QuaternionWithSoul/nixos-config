{ ... }: {
    
  boot = {

    loader = {

      systemd-boot.enable = true;
      
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

    };

    initrd = {
      availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
    };
    
    kernelModules = [ "kvm-intel" ];

  };

}
