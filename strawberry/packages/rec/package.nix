{ }: stdenv.mkDerivation {
  pname = "rec";
  version = "1.0";

  src = ./src;

  buildInputs = [
    pkgs.jellyfin-ffmpeg
    pkgs.pipewire
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp ./* $out/bin/
    mv $out/bin/app.sh $out/bin/rec
    chmod +x $out/bin/rec
  '';
}
