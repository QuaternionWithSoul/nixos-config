{ hostName, systemVersion, timeZone, pkgs, ... }: {
  imports = [
    ./audio

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

    firewall = {
      enable = true;
      
      allowedTCPPorts = [ 80 443 ];
      allowedTCPPortRanges = [
        { from = 2000; to = 9000; }
      ];

      allowedUDPPorts = [ 80 443 ];
      allowedUDPPortRanges = [
        { from = 2000; to = 9000; }
      ];
    };
  };

  time = {
    inherit timeZone;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = systemVersion;
}
