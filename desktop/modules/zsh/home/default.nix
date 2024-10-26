{ config, flakedir, ... }: {

  programs.zsh = {

    enable = true;

    enableCompletion = true;

    autosuggestion.enable = true;

    syntaxHighlighting.enable = true;

    shellAliases = {
      nix-rebuild = "doas nixos-rebuild switch --flake ${flakedir}";

      home-rebuild = "home-manager switch --flake ${flakedir}";

      flake-update = "nix flake update ${flakedir}";

      nix-gens-list = "nix-env --list-generations";

      nix-clear-gens = "nix-collect-garbage --delete-old";

      nix-clear-pkgs = "doas nix-collect-garbage -d";

      nix-clear-boot = "doas /run/current-system/bin/switch-to-configuration boot";

      nix-clear-all = "nix-clear-gens && nix-clear-pkgs && nix-clear-boot";

      zsh-custom = ''
        echo "nix-rebuild -> doas nixos-rebuild switch --flake ${flakedir}" &&
        echo "home-rebuild -> home-manager switch --flake ${flakedir}" &&
        echo "flake-update -> nix flake update ${flakedir}" &&
        echo "nix-gens-list -> nix-env --list-generations" &&
        echo "nix-clear-gens -> nix-collect-garbage --delete-old" &&
        echo "nix-clear-pkgs -> doas nix-collect-garbage -d" &&
        echo "nix-clear-boot -> doas /run/current-system/bin/switch-to-configuration boot" &&
        echo "nix-clear-all -> cleargens && clearold && clearboot"
      '';

      ll = "ls -l";
      ff = "fastfetch";
      nf = "neofetch";
    };

    history.size = 10000;
    
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" ];
      theme = "agnoster";
    };
    
  };

}
