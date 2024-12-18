{ hostName, systemVersion, timeZone, pkgs, ... }: {
  imports = [
    ./audio/pipewire.nix
    ./bluetooth
    ./networking/firewall.nix
    ./samba
    ./ssh
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
