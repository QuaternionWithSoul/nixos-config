{ pkgs }: pkgs.stdenv.mkDerivation {
  pname = "tlauncher";
  version = "1.0";

  src = ./src/tlauncher.jar;

  buildInputs = with pkgs; [
    jdk8
    jre8
    jre8_headless
    openjfx17
  ];

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    mkdir -p $out/share/tlauncher
    cp $src $out/share/tlauncher/app.jar
    cat > $out/bin/tlauncher <<EOF
    #!/bin/sh
    exec java -jar $out/share/tlauncher/app.jar "\$@"
    EOF
    chmod +x $out/bin/tlauncher
  '';
}
