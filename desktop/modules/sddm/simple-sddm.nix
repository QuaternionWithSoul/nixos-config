{ stdenv, fetchFromGitHub }: {

  simple-sddm = stdenv.mkDerivation rec {
    
    pname = "simple-sddm";

    version = "1.0";

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src $out/share/sddm/themes/simple-sddm
    '';

    src = fetchFromGitHub {
      owner = "JaKooLit";
      repo = "simple-sddm";
      rev = "main";
      sha256 = "1xhyri8gfzkz15z570slq1zr8a83q1c0zi80fny6syz0l8f2jkip";
    };

  };

}