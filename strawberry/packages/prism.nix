{ pkgs, ... }:
let 
  prismlauncher = pkgs.prismlauncher.overrideAttrs (
    oldAttrs: rec {
      src = pkgs.fetchFromGitHub {
        owner = "Diegiwg";
        repo = "PrismLauncher-Cracked";
        rev = "752668e50f155b21cd6de6b05192e0010517da31";
        sha256 = "0fgm9w32jsi8cg1hddx7dban0vlj5dlq0limp3rcv3l86w83qgc1";
      };
    }
  );
in {
  environment.systemPackages = [
    prismlauncher

    (prismlauncher.override {
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
