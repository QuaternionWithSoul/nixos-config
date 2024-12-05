{ ... }: {
  xdg.configFile."awesome" = {
    source = ./src;
    recursive = true;
  };

  imports = [ ./clipcat.nix ];
}
