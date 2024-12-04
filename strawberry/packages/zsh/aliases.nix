{ config, ... }:
let
  flakeDir = "~/nixos-config";
in {
  programs.zsh.shellAliases = {
    nix-rbld = "sudo nixos-rebuild switch --flake ${flakeDir}#strawberry --impure";
    home-rbld = "home-manager switch --flake ${flakeDir}#strawberry";
    flake-rbld = ''
      sudo nixos-rebuild switch --flake ${flakeDir}#strawberry --impure &&
      home-manager switch --flake ${flakeDir}#strawberry
    '';
    nix-cle = ''
      nix-collect-garbage --delete-old &&
      sudo nix-collect-garbage -d &&
      sudo /run/current-system/bin/switch-to-configuration boot
    '';

    ll = "ls -l";

    fstf = "fastfetch";
    neof = "neofetch";
    nrdf = "nerdfetch";
    tft = "fet.sh";
    pft = "pfetch";
    clock = "tty-clock -cs -C 4";

    cle = "clear";
    pwrf = "poweroff";
    rbt = "reboot";
  };
}
