{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    prismlauncher-unwrapped

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
