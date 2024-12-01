{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher

    (prismlauncher.override {
      additionalPrograms = [ ffmpeg ];

      jdks = [
        graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })
  ];
}
