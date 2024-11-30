{ config, ... }:
let
  flakeDir = "~/nixos-config";
in {
  programs.zsh.shellAliases = {
    nix-rbld = "doas nixos-rebuild switch --flake ${flakeDir}#strawberry";
    home-rbld = "home-manager switch --flake ${flakeDir}#strawberry";
    flake-rbld = ''
      doas nixos-rebuild switch --flake ${flakeDir}#strawberry &&
      home-manager switch --flake ${flakeDir}#strawberry
    '';
    nix-cle = ''
      nix-collect-garbage --delete-old &&
      doas nix-collect-garbage -d &&
      doas /run/current-system/bin/switch-to-configuration boot
    '';

    ll = "ls -l";
    fstf = "fastfetch";
    neof = "neofetch";
    nrdf = "nerdfetch";
    tft = "fet.sh";
    pft = "pfetch";
    clock = "tty-clock -cs -C 4";
    cle = "clear";
  };
}
