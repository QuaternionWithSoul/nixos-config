{ modulesPath, systemver, ... }: {

  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")

    ./hardware.nix

    ./boot
    ./disk
    ./microcode
    ./network
    ./nixpkgs
    ./services
    ./sound
    ./user
    ./video
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  time = {
    timeZone = "Turkey";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  system = {
    stateVersion = "${systemver}";
  };
}
