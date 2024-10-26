{ config, lib, pkgs, modulesPath, ... }: {

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {

    initrd = {
      availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-intel" ];

    extraModulePackages = [ ];
  };

  fileSystems = {

    "/" = {
      device = "/dev/disk/by-uuid/05d7544b-1597-46a2-baa3-ad0daa1b69e7";
      fsType = "ext4";
    };

    "/boot/efi" = {
      device = "/dev/disk/by-uuid/78DB-84B9";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  };

  swapDevices = [ {
    device = "/dev/disk/by-uuid/36f3a747-fdbd-4842-af57-76585053ff05";
  } ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
