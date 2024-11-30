{ hostName, systemVersion, timeZone, pkgs, ... }: {
  imports = [
    ./services/bluetooth.nix
    ./services/samba.nix
    ./services/ssh.nix
    
    ./user

    ./video/nvidia.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    inherit hostName;
  };

  time = {
    inherit timeZone;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = systemVersion;
}
