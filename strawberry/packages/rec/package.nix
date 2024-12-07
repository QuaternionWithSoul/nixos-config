{ pkgs }: pkgs.stdenv.mkDerivation {
  pname = "rec";
  version = "1.0";

  src = ./src;

  buildInputs = [
    pkgs.jellyfin-ffmpeg
    pkgs.pipewire
  ];

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/


    mkdir -p $out/bin

    cat > $out/bin/rec <<EOF
    exec $out/app.sh
    EOF

    chmod +x $out/bin/rec
  '';
}
