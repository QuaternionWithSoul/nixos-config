{ pkgs, prismlauncher, ... }: {
  environment.systemPackages = [
    prismlauncher.packages.${pkgs.system}.prismlauncher

    (prismlauncher.packages.${pkgs.system}.prismlauncher.override {
      additionalPrograms = with pkgs; [ ffmpeg ];
      
      jdks = with pkgs; [
        graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })
  ];
}
