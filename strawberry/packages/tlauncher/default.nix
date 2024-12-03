{ pkgs }: pkgs.stdenv.mkDerivation {
  pname = "tlauncher";
  version = "1.0";

  src = ./tlauncher.jar;

  nativeBuildInputs = [ pkgs.jdk8 ];
  buildInputs = [ pkgs.jre8_headless pkgs.java8OpenJfx ];

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
