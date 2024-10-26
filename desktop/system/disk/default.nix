{ ... }: {

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

}
