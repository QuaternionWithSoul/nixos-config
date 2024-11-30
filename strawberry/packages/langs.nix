{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustup

    gcc

    python3

    nodejs
  ];
}
