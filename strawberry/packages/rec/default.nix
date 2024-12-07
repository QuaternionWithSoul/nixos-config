{ ... }: {
  environment.systemPackages = [
    (import ./package.nix {})
  ];
}
